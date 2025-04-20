import 'dart:developer';

import 'package:besta/core/errors/exceptions.dart';
import 'package:besta/core/errors/failures.dart';
import 'package:besta/core/services/data_base_service.dart';
import 'package:besta/core/services/firebase_auth_service.dart';
import 'package:besta/core/utils/backend_end_points.dart';
import 'package:besta/feature/Auth/data/models/user_model.dart';
import 'package:besta/feature/Auth/domain/entity/user_entity.dart';
import 'package:besta/feature/Auth/domain/repos/auth_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepoImpl extends AuthRepo {
  final FirebaseAuthService firebaseAuthService;
  final DataBaseService dataBaseService;
  AuthRepoImpl({
    required this.firebaseAuthService,
    required this.dataBaseService,
  });

  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
      String email, String password, String name) async {
    User? user;

    try {
      user = await firebaseAuthService.createUserWithEmailAndPassword(
          email: email, password: password);
      var userEntity = UserEntity(name: name, email: email, uID: user.uid);
      await addUserData(user: userEntity);
      return right(userEntity);
    } on CustomException catch (e) {
      await deleteUser(user);
      return left(ServerFailuer(e.message));
    } catch (e) {
      await deleteUser(user);
      log('Exception in AuthRepoImpl.createUserWithEmailAndPassword: ${e.toString()}');
      return left(ServerFailuer('هناك خطأ ما, حاول مرة اخرى لاحقا'));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      var user = await firebaseAuthService.signInWithEmailAndPassword(
          email: email, password: password);
          var userEntity = await getUserData(uid: user.uid);
      return right(userEntity);
    } on CustomException catch (e) {
      return left(ServerFailuer(e.message));
    } catch (e) {
      log('Exception in AuthRepoImpl.signInWithEmailAndPassword: ${e.toString()}');
      return left(ServerFailuer('هناك خطأ ما, حاول مرة اخرى لاحقا'));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithGoogle() async {
    User? user;
    try {
      user = await firebaseAuthService.signInWithGoogle();
      var userEntity = UserModel.fromFirebaseUser(user);
      await addUserData(user: userEntity);
      return right(userEntity);
    } catch (e) {
      deleteUser(user);
      log('Exception in AuthRepoImpl.signInWithGoogle : ${e.toString()}');
      return left(ServerFailuer('هناك خطأ ما, حاول مرة اخرى لاحقا'));
    }
  }

  Future addUserData({required UserEntity user}) async {
    await dataBaseService.addData(
        path: BackendEndPoints.addUserData,
        data: user.toMap(),
        documentID: user.uID);
  }

  Future<UserEntity> getUserData({required String uid}) async{
    var userData = await dataBaseService.getData(path: BackendEndPoints.getUserData, documentID: uid);
    return UserModel.fromJson(userData);
  }

  Future<void> deleteUser(User? user) async{
    user ?? await firebaseAuthService.deleteUser();
  }


}

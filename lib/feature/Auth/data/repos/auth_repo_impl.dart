import 'dart:developer';

import 'package:besta/core/errors/exceptions.dart';
import 'package:besta/core/errors/failures.dart';
import 'package:besta/core/services/data_base_service.dart';
import 'package:besta/core/services/firebase_auth_service.dart';
import 'package:besta/core/services/local_data_base_service.dart';
import 'package:besta/core/utils/backend_end_points.dart';
import 'package:besta/core/utils/hive_boxes.dart';
import 'package:besta/feature/Auth/data/models/user_model.dart';
import 'package:besta/feature/Auth/domain/entity/user_entity.dart';
import 'package:besta/feature/Auth/domain/repos/auth_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepoImpl extends AuthRepo {
  final FirebaseAuthService firebaseAuthService;
  final DataBaseService dataBaseService;
  final LocalDataBaseService hiveDataBase;
  AuthRepoImpl({
    required this.hiveDataBase,
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
      var userModel = UserModel.fromFirebaseUser(user);
      await saveUserLocally(user: userModel);
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
      var userModel = UserModel.fromFirebaseUser(user);
      await saveUserLocally(user: userModel);
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
      var isUserExists = await dataBaseService.checkIfDataExist(
          path: BackendEndPoints.usersEndPoint, documentID: user.uid);
      if (!isUserExists) {
        await addUserData(user: userEntity);
      } else {
        await getUserData(uid: user.uid);
      }
      var userModel = UserModel.fromFirebaseUser(user);
      await saveUserLocally(user: userModel);
      return right(userEntity);
    } catch (e) {
      deleteUser(user);
      log('Exception in AuthRepoImpl.signInWithGoogle : ${e.toString()}');
      return left(ServerFailuer('هناك خطأ ما, حاول مرة اخرى لاحقا'));
    }
  }

  Future saveUserLocally({required UserModel user}) async {
    await hiveDataBase.addData(
        boxName: HiveBoxes.userBox, key: 'userData', value: user.toMap());
  }

  Future addUserData({required UserEntity user}) async {
    await dataBaseService.addData(
        path: BackendEndPoints.usersEndPoint,
        data: user.toMap(),
        documentID: user.uID);
  }

  Future<UserEntity> getUserData({required String uid}) async {
    var userData = await dataBaseService.getData(
        path: BackendEndPoints.usersEndPoint, documentID: uid);
    return UserModel.fromJson(userData);
  }

  Future<void> deleteUser(User? user) async {
    if (user != null) {
      await firebaseAuthService.deleteUser();
    }
  }
}

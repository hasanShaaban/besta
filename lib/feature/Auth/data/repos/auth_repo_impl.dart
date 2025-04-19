import 'dart:developer';

import 'package:besta/core/errors/exceptions.dart';
import 'package:besta/core/errors/failures.dart';
import 'package:besta/core/services/firebase_auth_service.dart';
import 'package:besta/feature/Auth/data/models/user_model.dart';
import 'package:besta/feature/Auth/domain/entity/user_entity.dart';
import 'package:besta/feature/Auth/domain/repos/auth_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepoImpl extends AuthRepo {
  final FirebaseAuthService firebaseAuthService;

  AuthRepoImpl({required this.firebaseAuthService});

  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
      String email, String password, String name) async {
    User? user;

    try {
      user = await firebaseAuthService.createUserWithEmailAndPassword(
          email: email, password: password);
      return right(UserModel.fromFirebaseUser(user));
    } on CustomException catch (e) {
      return left(ServerFailuer(e.message));
    }catch (e){
      log('Exception in AuthRepoImpl.createUserWithEmailAndPassword: ${e.toString()}');
      return left(ServerFailuer('هناك خطأ ما, حاول مرة اخرى لاحقا'));
    }
  }
}

import 'package:besta/core/errors/failures.dart';
import 'package:besta/feature/Auth/domain/entity/user_entity.dart';
import 'package:dartz/dartz.dart';


abstract class AuthRepo {
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(String email, String password, String name);

  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword(String email, String password);

  Future<Either<Failure, UserEntity>> signInWithGoogle();
}
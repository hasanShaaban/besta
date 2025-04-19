import 'package:besta/feature/Auth/domain/entity/user_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserModel extends UserEntity {
  UserModel({required super.name, required super.email, required super.uID});
  factory UserModel.fromFirebaseUser(User user) {
    return UserModel(
        name: user.displayName ?? '', email: user.email ?? '', uID: user.uid);
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        name: json['name'], email: json['email'], uID: json['uID']);
  }
}

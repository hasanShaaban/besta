part of 'singup_cubit.dart';

sealed class SingupState {}

final class SingupInitial extends SingupState {}
final class SingupLoading extends SingupState {}
final class SingupSuccess extends SingupState {
  final UserEntity user;
  SingupSuccess({required this.user});
}

final class SingupFailure extends SingupState {
  final String message;
  SingupFailure({required this.message});
}

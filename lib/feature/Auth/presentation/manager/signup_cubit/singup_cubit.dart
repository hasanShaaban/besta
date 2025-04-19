import 'package:besta/feature/Auth/domain/entity/user_entity.dart';
import 'package:besta/feature/Auth/domain/repos/auth_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'singup_state.dart';

class SingupCubit extends Cubit<SingupState> {
  SingupCubit(this.authRepo) : super(SingupInitial());

  final AuthRepo authRepo;

  Future<void> createUserWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
  }) async {
    emit(SingupLoading());
    final result =
        await authRepo.createUserWithEmailAndPassword(email, password, name);
    result.fold(
      (failuer) => emit(SingupFailure(message: failuer.message)),
      (userEntity) => emit(SingupSuccess(user: userEntity)),
    );
  }
}

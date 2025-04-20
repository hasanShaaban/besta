import 'package:besta/feature/Auth/domain/entity/user_entity.dart';
import 'package:besta/feature/Auth/domain/repos/auth_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'singin_state.dart';

class SinginCubit extends Cubit<SigninState> {
  SinginCubit(this.authRepo) : super(SigninInitial());
  final AuthRepo authRepo;

  Future<void> singin(String email, String password) async {
    emit(SigninLoading());
    final result = await authRepo.signInWithEmailAndPassword(email, password);
    result.fold(
      (failuer) => emit(SigninFailure(message: failuer.message)),
      (userEntity) => emit(SigninSuccess(userEntity: userEntity)),
    );
  }

  Future<void> signInWithGoogle() async {
    emit(SigninLoading());
    var result = await authRepo.signInWithGoogle();
    result.fold((failuer) => emit(SigninFailure(message: failuer.message)),
        (response) => emit(SigninSuccess(userEntity: response)));
  }
}

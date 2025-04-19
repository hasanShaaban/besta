import 'package:besta/core/services/firebase_auth_service.dart';
import 'package:besta/feature/Auth/data/repos/auth_repo_impl.dart';
import 'package:besta/feature/Auth/domain/repos/auth_repo.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupGetit() {
  getIt.registerSingleton<FirebaseAuthService>(FirebaseAuthService());
  getIt.registerSingleton<AuthRepo>(AuthRepoImpl(firebaseAuthService: getIt<FirebaseAuthService>()));
}
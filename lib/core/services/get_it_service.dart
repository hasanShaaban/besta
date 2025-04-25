import 'package:besta/core/services/data_base_service.dart';
import 'package:besta/core/services/fire_store_service.dart';
import 'package:besta/core/services/firebase_auth_service.dart';
import 'package:besta/core/services/hive_data_base_service.dart';
import 'package:besta/core/services/local_data_base_service.dart';
import 'package:besta/feature/Auth/data/repos/auth_repo_impl.dart';
import 'package:besta/feature/on_boarding/data/repos/on_boarding_local_data_source.dart';
import 'package:besta/feature/Auth/domain/repos/auth_repo.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupGetit() {
  getIt.registerSingleton<FirebaseAuthService>(FirebaseAuthService());
  getIt.registerSingleton<DataBaseService>(FireStoreService());
  getIt.registerSingleton<AuthRepo>(AuthRepoImpl(firebaseAuthService: getIt<FirebaseAuthService>(), dataBaseService: getIt<DataBaseService>()));
  getIt.registerSingleton<LocalDataBaseService>(HiveDataBaseService());
  getIt.registerSingleton<OnBoardingLocalDataSource>(OnBoardingLocalDataSource(getIt<LocalDataBaseService>()));
}
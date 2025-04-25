import 'package:besta/core/services/local_data_base_service.dart';
import 'package:besta/core/utils/hive_boxes.dart';

class AuthLocalDataSource {
  final LocalDataBaseService localDataBaseService;

  AuthLocalDataSource(this.localDataBaseService);

  static const key = 'authSeen';

  Future<void> setAuthSeen() async {
    await localDataBaseService.addData(boxName: HiveBoxes.settingsBox, key: key, value: true);
  }

  Future<bool> isAuthSeen() async {
    final seen = await localDataBaseService.getData(boxName: HiveBoxes.settingsBox, key: key);
    return seen ?? false;
  }
}
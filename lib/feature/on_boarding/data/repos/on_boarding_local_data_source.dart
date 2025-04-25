import 'package:besta/core/services/local_data_base_service.dart';

class OnBoardingLocalDataSource {
  final LocalDataBaseService localDataBaseService;

  OnBoardingLocalDataSource(this.localDataBaseService);

  static const boxName = 'setting';
  static const key = 'onBoardingSeen';

  Future<void> setOnBoardingSeen() async {
    await localDataBaseService.addData(boxName: boxName, key: key, value: true);
  }

  Future<bool> isOnBoardingSeen() async {
    final seen = await localDataBaseService.getData(boxName: boxName, key: key);
    return seen ?? false;
  }
}
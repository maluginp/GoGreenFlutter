import 'package:gogreen/models/store_models.dart';

abstract class IStoreLocationsService {
  Future<List<Store>> fetchStores();
}

abstract class IStoreService {
  Future<List<Department>> getDepartments();
  Future<List<Good>> getGoods();
}

class StoreLocationsService extends IStoreLocationsService {
  @override
  Future<List<Store>> fetchStores() => Future.value([Store()..name="Test"]);
}
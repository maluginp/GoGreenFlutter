import 'package:gogreen/models/store_models.dart';

abstract class IStoreLocationsService {
  Future<List<Store>> fetchStores();
}

abstract class IStoreService {
  Future<List<Department>> fetchDepartments();
  Future<List<Good>> fetchGoods();
}

class StoreLocationsService extends IStoreLocationsService {
  @override
  Future<List<Store>> fetchStores() => Future.value([Store()..name="Test"]);
}

class StoreService extends IStoreService {

  @override
  Future<List<Department>> fetchDepartments() =>  Future.value([Department()..name="Test"]);

  @override
  Future<List<Good>> fetchGoods() => Future.value([Good()..name="Test"]);
}
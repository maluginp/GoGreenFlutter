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
  Future<List<Store>> fetchStores() => Future.value([Store()..name = "Test"]);
}

class StoreService extends IStoreService {
  @override
  Future<List<Department>> fetchDepartments() =>
      Future.value([Department()..name = "Test"]);

  @override
  Future<List<Good>> fetchGoods() => Future.value([
        Good()
          ..guid = "1235-asdasd-123gh"
          ..name = "Burger"
          ..image = "https://www.iconninja.com/files/458/848/840/junk-food-food-burger-hamburger-fast-food-icon.png"
          ..price = 2.00,
        SubDepartmentGood()
          ..guid = "b12ga35-asdasd-123gh"
          ..name = "Sandwiches"
          ..image = "http://www.i2clipart.com/cliparts/f/5/d/5/clipart-vegetarian-sandwich-f5d5.png",
        Good()
          ..guid = "12hkasd-1daaaadbb-caaaa"
          ..name = "Coca-Cola"
          ..image = "https://ru.seaicons.com/wp-content/uploads/2015/06/Coca-Cola-Smudge-icon.png"
          ..price = 1.00
      ]);
}

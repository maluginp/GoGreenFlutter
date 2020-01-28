import 'package:gogreen/models/store_models.dart';

abstract class IStoreService {
  Future<List<Department>> getDepartments();
  Future<List<Good>> getGoods();
}
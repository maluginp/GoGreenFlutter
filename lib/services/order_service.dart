import 'package:gogreen/models/order_models.dart';
import 'package:gogreen/models/store_models.dart';

abstract class IOrderHistoryService {
  Future<List<Order>> fetchOrders();
}

abstract class IOrderService {
  Future<OrderLineItem> addGood(Good good);

  Future<Order> checkout();
}

import 'package:gogreen/models/order_models.dart';
import 'package:gogreen/models/store_models.dart';

abstract class IOrderHistoryService {
  Future<List<Order>> fetchOrders();
}

abstract class IOrderService {
  Future<OrderLineItem> addGood(Good good);

  Future<Order> checkout();

  Future<List<OrderLineItem>> fetchLines();
}


class OrderHistoryService extends IOrderHistoryService {
  @override
  Future<List<Order>> fetchOrders() => Future.value([Order()..name="Test"]);
}

class OrderService extends IOrderService {
  List<OrderLineItem> lines = [];

  @override
  Future<OrderLineItem> addGood(Good good) {
    var line = OrderLineItem()..name=good.name;
    lines.add(line);
    return Future.value(line);
  }

  @override
  Future<List<OrderLineItem>> fetchLines() => Future.value(lines);

  @override
  Future<Order> checkout() {
    return Future.value(Order());
  }
}
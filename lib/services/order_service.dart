import 'package:gogreen/core/helpers.dart';
import 'package:gogreen/models/order_models.dart';
import 'package:gogreen/models/store_models.dart';

abstract class IOrderHistoryService {
  Future<List<Order>> fetchOrders();
}

abstract class IOrderService {
  Future<OrderLineItem> addGood(Good good);

  Future<Order> checkout();

  Future<List<OrderLineItem>> fetchLines();

  Future<int> getTotalQuantity();
  Future<double> getTotalAmount();
}


class OrderHistoryService extends IOrderHistoryService {
  @override
  Future<List<Order>> fetchOrders() => Future.value([Order()..name="Test"]);
}

class OrderService extends IOrderService {
  List<OrderLineItem> lines = [];

  @override
  Future<OrderLineItem> addGood(Good good) {
    var line = OrderLineItem.fromGood(good)
      ..quantity=1;
    lines.add(line);
    return Future.value(line);
  }

  @override
  Future<List<OrderLineItem>> fetchLines() => Future.value(lines);

  @override
  Future<Order> checkout() {
    lines.clear();
    return Future.value(Order());
  }

  @override
  Future<double> getTotalAmount() async {
      if (lines.length > 0) {
        return lines.map((l) => l.price).reduce(sum);
      }
      return 0;
  }

  @override
  Future<int> getTotalQuantity() async {
    if (lines.length > 0) {
      return lines.map((l) => l.quantity).reduce(sum);
    }
    return 0;
  }


}
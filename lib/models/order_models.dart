import 'package:gogreen/core/helpers.dart';

import 'store_models.dart';

class Order {
  String name;
  List<OrderLineItem> lineItems;
}

class OrderLineItem {
  String guid;
  String name;
  String goodGuid;
  double price;
  String image;
  int quantity;

  OrderLineItem();

  factory OrderLineItem.fromGood(Good good) {
    return OrderLineItem()
        ..guid=GuidHelper.generate()
        ..name=good.name
        ..goodGuid=good.guid
        ..price=good.price
        ..image=good.image
        ;
  }
}

class OrderLineItemModifier {
  String guid;
  String modifierGuid;
  String name;

  List<OrderLineItemOption> options;
}

class OrderLineItemOption {
  String guid;
  String optionGuid;
  double price;
  String name;
}
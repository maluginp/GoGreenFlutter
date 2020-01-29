import 'package:equatable/equatable.dart';
import 'package:gogreen/models/order_models.dart';

abstract class OrderLinesState extends Equatable {
  const OrderLinesState();
}

class LoadingOrderLinesState extends OrderLinesState {
  @override
  List<Object> get props => [];
}


class FetchedOrderLinesState extends OrderLinesState {
  final List<OrderLineItem> lines;

  FetchedOrderLinesState(this.lines);

  @override
  List<Object> get props => [lines.length];
}

import 'package:equatable/equatable.dart';
import 'package:gogreen/models/order_models.dart';

abstract class OrderListState extends Equatable {
  const OrderListState();
}

class LoadingOrderListState extends OrderListState {
  @override
  List<Object> get props => [];
}

class FetchedOrderListState extends OrderListState {
  final List<Order> orders;

  FetchedOrderListState(this.orders);

  @override
  List<Object> get props => [];
}
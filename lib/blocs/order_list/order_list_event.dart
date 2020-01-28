import 'package:equatable/equatable.dart';

abstract class OrderListEvent extends Equatable {
  const OrderListEvent();
}

class FetchOrderListEvent extends OrderListEvent {

  @override
  List<Object> get props => [];
}
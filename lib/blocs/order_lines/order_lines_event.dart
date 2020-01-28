import 'package:equatable/equatable.dart';

abstract class OrderLinesEvent extends Equatable {
  const OrderLinesEvent();
}

class FetchOrderLinesEvent extends OrderLinesEvent {
  @override
  List<Object> get props => [];
}

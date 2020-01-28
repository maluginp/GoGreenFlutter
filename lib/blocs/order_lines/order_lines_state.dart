import 'package:equatable/equatable.dart';

abstract class OrderLinesState extends Equatable {
  const OrderLinesState();
}

class InitialOrderLinesState extends OrderLinesState {
  @override
  List<Object> get props => [];
}

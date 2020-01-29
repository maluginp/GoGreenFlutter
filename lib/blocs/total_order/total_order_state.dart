import 'package:equatable/equatable.dart';

abstract class TotalOrderState extends Equatable {
  const TotalOrderState();
}

class InitialTotalOrderState extends TotalOrderState {
  @override
  List<Object> get props => [];
}

class CalculatedTotalOrderState extends TotalOrderState {
  final int totalQuantity;
  final double totalAmount;

  CalculatedTotalOrderState(this.totalQuantity, this.totalAmount);

  @override
  List<Object> get props => [totalQuantity];
}

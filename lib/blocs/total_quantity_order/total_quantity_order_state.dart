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

  CalculatedTotalOrderState(this.totalQuantity);

  @override
  List<Object> get props => [totalQuantity];
}

import 'package:equatable/equatable.dart';

abstract class TotalQuantityOrderState extends Equatable {
  const TotalQuantityOrderState();
}

class InitialTotalQuantityOrderState extends TotalQuantityOrderState {
  @override
  List<Object> get props => [];
}

class UpdatedTotalQuantityOrderState extends TotalQuantityOrderState {
  final int totalQuantity;

  UpdatedTotalQuantityOrderState(this.totalQuantity);

  @override
  List<Object> get props => [totalQuantity];
}

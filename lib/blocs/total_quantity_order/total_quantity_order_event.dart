import 'package:equatable/equatable.dart';

abstract class TotalQuantityOrderEvent extends Equatable {
  const TotalQuantityOrderEvent();
}

class UpdateTotalQuantityOrderEvent extends TotalQuantityOrderEvent {
  @override
  List<Object> get props => [];
}
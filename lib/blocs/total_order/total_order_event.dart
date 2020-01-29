import 'package:equatable/equatable.dart';

abstract class TotalOrderEvent extends Equatable {
  const TotalOrderEvent();
}

class GetTotalOrderEvent extends TotalOrderEvent {
  @override
  List<Object> get props => [];
}
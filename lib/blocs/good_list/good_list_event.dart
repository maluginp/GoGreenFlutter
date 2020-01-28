import 'package:equatable/equatable.dart';

abstract class GoodListEvent extends Equatable {
  const GoodListEvent();
}

class FetchGoodListEvent extends GoodListEvent {
  @override
  List<Object> get props => [];
}
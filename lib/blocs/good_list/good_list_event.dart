import 'package:equatable/equatable.dart';
import 'package:gogreen/models/store_models.dart';

abstract class GoodListEvent extends Equatable {
  const GoodListEvent();
}

class FetchGoodListEvent extends GoodListEvent {
  @override
  List<Object> get props => [];
}

class AddGoodToOrderGoodListEvent extends GoodListEvent {
  final Good good;

  AddGoodToOrderGoodListEvent(this.good);

  @override
  List<Object> get props => [good];
}
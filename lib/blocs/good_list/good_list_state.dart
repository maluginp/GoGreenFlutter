import 'package:equatable/equatable.dart';
import 'package:gogreen/models/order_models.dart';
import 'package:gogreen/models/store_models.dart';

abstract class GoodListState extends Equatable {
  const GoodListState();
}

class LoadingGoodListState extends GoodListState {
  @override
  List<Object> get props => [];
}

class FetchedGoodListState extends GoodListState {
  final List<Good> goods;

  FetchedGoodListState(this.goods);

  @override
  List<Object> get props => [];
}

class AddedToOrderGoodListState extends GoodListState {
  OrderLineItem lineItem;

  AddedToOrderGoodListState(this.lineItem);

  @override
  List<Object> get props => [lineItem];
}
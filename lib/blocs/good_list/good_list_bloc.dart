import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:gogreen/models/order_models.dart';
import 'package:gogreen/models/store_models.dart';
import 'package:gogreen/services/services.dart';
import './bloc.dart';

class GoodListBloc extends Bloc<GoodListEvent, GoodListState> {
  final ILogService _logService;
  final IStoreService _storeService;
  final IOrderService _orderService;

  GoodListBloc(this._logService, this._storeService, this._orderService);

  @override
  GoodListState get initialState => LoadingGoodListState();

  @override
  Stream<GoodListState> mapEventToState(
    GoodListEvent event,
  ) async* {
    if (event is FetchGoodListEvent) {
      List<Good> goods = await _storeService.fetchGoods();
      yield FetchedGoodListState(goods);
    }

    if (event is AddGoodToOrderGoodListEvent) {
      OrderLineItem lineItem = await _orderService.addGood(event.good);
      yield AddedToOrderGoodListState(lineItem);
    }
  }
}

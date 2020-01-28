import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:gogreen/models/order_models.dart';
import 'package:gogreen/services/services.dart';
import './bloc.dart';

class OrderListBloc extends Bloc<OrderListEvent, OrderListState> {
  final ILogService _logService;
  final IOrderHistoryService _orderHistoryService;

  OrderListBloc(this._logService, this._orderHistoryService);

  @override
  OrderListState get initialState => LoadingOrderListState();

  @override
  Stream<OrderListState> mapEventToState(
    OrderListEvent event,
  ) async* {
    if (event is FetchOrderListEvent) {
      List<Order> orders = await _orderHistoryService.fetchOrders();
      yield FetchedOrderListState(orders);
    }
  }
}

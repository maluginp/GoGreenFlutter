import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:gogreen/models/order_models.dart';
import 'package:gogreen/services/services.dart';
import './bloc.dart';

class OrderLinesBloc extends Bloc<OrderLinesEvent, OrderLinesState> {
  final ILogService _logService;
  final IOrderService _orderService;

  OrderLinesBloc(this._logService, this._orderService);

  @override
  OrderLinesState get initialState => LoadingOrderLinesState();

  @override
  Stream<OrderLinesState> mapEventToState(
    OrderLinesEvent event,
  ) async* {
    if (event is FetchOrderLinesEvent) {
      List<OrderLineItem> lines = await _orderService.fetchLines();
      yield FetchedOrderLinesState(lines);
    }

    if (event is CheckoutOrderLinesEvent) {
      await _orderService.checkout();
      yield LoadingOrderLinesState();
      List<OrderLineItem> lines = await _orderService.fetchLines();
      yield FetchedOrderLinesState(lines);
    }
  }
}

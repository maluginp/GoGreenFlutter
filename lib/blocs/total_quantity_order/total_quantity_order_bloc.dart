import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:gogreen/models/order_models.dart';
import 'package:gogreen/services/services.dart';
import './bloc.dart';

class TotalQuantityOrderBloc extends Bloc<TotalQuantityOrderEvent, TotalQuantityOrderState> {
  final ILogService _logService;
  final IOrderService _orderService;

  TotalQuantityOrderBloc(this._logService, this._orderService);

  @override
  TotalQuantityOrderState get initialState => InitialTotalQuantityOrderState();

  @override
  Stream<TotalQuantityOrderState> mapEventToState(
    TotalQuantityOrderEvent event,
  ) async* {
    if (event is UpdateTotalQuantityOrderEvent) {
      List<OrderLineItem> lines = await _orderService.fetchLines();
      yield UpdatedTotalQuantityOrderState(lines.length);
    }
  }
}

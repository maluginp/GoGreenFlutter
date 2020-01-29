import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:gogreen/models/order_models.dart';
import 'package:gogreen/services/services.dart';
import './bloc.dart';

class TotalOrderBloc extends Bloc<TotalOrderEvent, TotalOrderState> {
  final ILogService _logService;
  final IOrderService _orderService;

  TotalOrderBloc(this._logService, this._orderService);

  @override
  TotalOrderState get initialState => InitialTotalOrderState();

  @override
  Stream<TotalOrderState> mapEventToState(TotalOrderEvent event,) async* {
    if (event is GetTotalOrderEvent) {
      int totalQuantity = await _orderService.getTotalQuantity();
      double totalAmount = await _orderService.getTotalAmount();

      yield CalculatedTotalOrderState(totalQuantity, totalAmount);
    }
  }
}

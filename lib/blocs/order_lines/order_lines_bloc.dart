import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';

class OrderLinesBloc extends Bloc<OrderLinesEvent, OrderLinesState> {
  @override
  OrderLinesState get initialState => InitialOrderLinesState();

  @override
  Stream<OrderLinesState> mapEventToState(
    OrderLinesEvent event,
  ) async* {
    // TODO: Add Logic
  }
}

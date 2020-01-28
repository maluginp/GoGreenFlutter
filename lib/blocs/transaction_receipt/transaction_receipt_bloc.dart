import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';

class TransactionReceiptBloc extends Bloc<TransactionReceiptEvent, TransactionReceiptState> {
  @override
  TransactionReceiptState get initialState => InitialTransactionReceiptState();

  @override
  Stream<TransactionReceiptState> mapEventToState(
    TransactionReceiptEvent event,
  ) async* {
    // TODO: Add Logic
  }
}

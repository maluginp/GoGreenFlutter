import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:gogreen/services/services.dart';
import './bloc.dart';

class TransactionReceiptBloc extends Bloc<TransactionReceiptEvent, TransactionReceiptState> {
  final ILogService _logService;
  final ITransactionService _transactionService;

  TransactionReceiptBloc(this._logService, this._transactionService);

  @override
  TransactionReceiptState get initialState => LoadingTransactionReceiptState();

  @override
  Stream<TransactionReceiptState> mapEventToState(
    TransactionReceiptEvent event,
  ) async* {
      if (event is LoadTransactionReceiptEvent) {
        String receipt = await _transactionService.fetchReceipt();
        yield LoadedTransactionReceiptState(receipt);
      }
  }
}

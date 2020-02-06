import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:gogreen/models/transaction_model.dart';
import 'package:gogreen/services/services.dart';
import './bloc.dart';

class TransactionReceiptBloc extends Bloc<TransactionReceiptEvent, TransactionReceiptState> {
  final ILogService _logService;
  final ITransactionService _transactionService;
  final Transaction _transaction;

  TransactionReceiptBloc(this._logService, this._transactionService, this._transaction);

  @override
  TransactionReceiptState get initialState => LoadingTransactionReceiptState();

  @override
  Stream<TransactionReceiptState> mapEventToState(
    TransactionReceiptEvent event,
  ) async* {
      if (event is LoadTransactionReceiptEvent) {
        String receipt = await _transactionService.fetchReceipt(_transaction.id);
        yield LoadedTransactionReceiptState(receipt);
      }
  }
}

import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:gogreen/models/location_model.dart';
import 'package:gogreen/models/transaction_model.dart';
import 'package:gogreen/services/services.dart';
import './bloc.dart';

class TransactionListBloc extends Bloc<TransactionListEvent, TransactionListState> {
  final ILogService _logService;
  final ITransactionService _transactionService;
  final Location _location;

  TransactionListBloc(this._logService, this._transactionService, this._location);

  @override
  TransactionListState get initialState => LoadingTransactionListState(null);

  @override
  Stream<TransactionListState> mapEventToState(
    TransactionListEvent event,
  ) async* {
    if (event is FetchTransactionListEvent) {
      _logService.d('Fetch locations with filter=${event.filter}');
      yield LoadingTransactionListState(event.filter);

      List<Transaction> transactions = await _transactionService.fetchTransactions(event.filter);

      yield FetchedTransactionListState(event.filter, transactions);
    }
  }
}

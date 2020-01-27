import 'package:equatable/equatable.dart';
import 'package:gogreen/models/filter_model.dart';
import 'package:gogreen/models/transaction_model.dart';

abstract class TransactionListState extends Equatable {
  const TransactionListState();
}

class LoadingTransactionListState extends TransactionListState {
  final TransactionListFilter filter;

  LoadingTransactionListState(this.filter);

  bool get hasFilter => this.filter != null;

  @override
  List<Object> get props => [filter];

}


class FetchedTransactionListState extends TransactionListState {
  final TransactionListFilter filter;
  final List<Transaction> transactions;

  FetchedTransactionListState(this.filter, this.transactions);

  bool get hasFilter => this.filter != null;

  @override
  List<Object> get props => [filter, transactions];
}

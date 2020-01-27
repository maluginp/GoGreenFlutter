import 'package:equatable/equatable.dart';
import 'package:gogreen/models/filter_model.dart';

abstract class TransactionListEvent extends Equatable {
  const TransactionListEvent();
}


class FetchTransactionListEvent extends TransactionListEvent {
  final TransactionListFilter filter;

  FetchTransactionListEvent(this.filter);

  @override
  List<Object> get props => [filter];
}
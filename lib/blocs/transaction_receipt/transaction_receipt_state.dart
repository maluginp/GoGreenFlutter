import 'package:equatable/equatable.dart';

abstract class TransactionReceiptState extends Equatable {
  const TransactionReceiptState();
}

class LoadingTransactionReceiptState extends TransactionReceiptState {
  @override
  List<Object> get props => [];
}

class LoadedTransactionReceiptState extends TransactionReceiptState {
  final String html;

  LoadedTransactionReceiptState(this.html);

  @override
  List<Object> get props => [];
}

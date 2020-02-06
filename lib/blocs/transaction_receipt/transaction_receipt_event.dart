import 'package:equatable/equatable.dart';

abstract class TransactionReceiptEvent extends Equatable {
  const TransactionReceiptEvent();
}


class LoadTransactionReceiptEvent extends TransactionReceiptEvent {
  @override
  List<Object> get props => [];
}

class ShareTransactionReceiptEvent extends TransactionReceiptEvent {
  @override
  List<Object> get props => [];
}
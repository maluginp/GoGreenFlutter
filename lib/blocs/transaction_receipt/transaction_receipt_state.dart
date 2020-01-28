import 'package:equatable/equatable.dart';

abstract class TransactionReceiptState extends Equatable {
  const TransactionReceiptState();
}

class InitialTransactionReceiptState extends TransactionReceiptState {
  @override
  List<Object> get props => [];
}

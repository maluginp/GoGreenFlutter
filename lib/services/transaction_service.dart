import 'package:gogreen/models/filter_model.dart';
import 'package:gogreen/models/transaction_model.dart';

abstract class ITransactionService {
  Future<List<Transaction>> fetchTransactions(TransactionListFilter filter);
}

class TransactionService implements ITransactionService {

  @override
  Future<List<Transaction>> fetchTransactions(TransactionListFilter filter) => Future.value([]);
}
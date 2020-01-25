import 'package:gogreen/models/transaction_model.dart';

abstract class ITransactionService {
  Future<List<Transaction>> fetchTransactions();
}

class TransactionService implements ITransactionService {

  @override
  Future<List<Transaction>> fetchTransactions() => Future.value([]);
}
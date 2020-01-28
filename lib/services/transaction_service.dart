import 'package:gogreen/models/filter_model.dart';
import 'package:gogreen/models/transaction_model.dart';

abstract class ITransactionService {
  Future<List<Transaction>> fetchTransactions(TransactionListFilter filter);
  Future<String> fetchReceipt();
}

class TransactionService implements ITransactionService {

  @override
  Future<List<Transaction>> fetchTransactions(TransactionListFilter filter) => Future.value([]);

  @override
  Future<String> fetchReceipt() => Future.value("<h1>Hello World</h1>");

}
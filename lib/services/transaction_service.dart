import 'dart:convert';

import 'package:gogreen/core/http.dart';
import 'package:gogreen/models/filter_model.dart';
import 'package:gogreen/models/common_models.dart';
import 'package:gogreen/models/transaction_model.dart';

abstract class ITransactionService {
  Future<List<Transaction>> fetchTransactions(
      TransactionListFilter filter, int locationId, int page);

  Future<String> fetchReceipt(int transactionId);
}

class TransactionService implements ITransactionService {
  final DenovoHttpClient _denovoHttpClient;
  static const int ITEMS_ON_PAGE = 10;

  TransactionService(this._denovoHttpClient);

  @override
  Future<List<Transaction>> fetchTransactions(
      TransactionListFilter filter, int locationId, int page) async {
    if (page <= 0) {
      throw Exception("page must be great than 0, current=$page");
    }

    var response = await _denovoHttpClient.getWithArgs(
      "api/consumers/transactions",
      query: {
        "take": ITEMS_ON_PAGE,
        "skip": ITEMS_ON_PAGE * (page - 1),
        "locationId": locationId
      },
    );

    if (response.statusCode == 200) {
      var body = json.decode(response.body);
      var resource = ResourcePage.fromJson(body, (i) => Transaction.fromJson(i));
      print("Resource $resource");
      return resource.items;
    }

    return [];
  }

  @override
  Future<String> fetchReceipt(int transactionId) async {
    var response = await _denovoHttpClient.getWithArgs(
      "api/transactions/receipt",
      query: {
        "id": transactionId,
        "section": 1,
      },
    );

    if (response.statusCode == 200) {
      var receipt = response.body;
      if (receipt != "\"\"") {
        receipt = receipt.substring(1);
        receipt = receipt.substring(0, receipt.length - 1);
        return receipt;
      }

    }

    return "";
  }
}

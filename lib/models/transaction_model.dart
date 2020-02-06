import 'package:gogreen/core/helpers.dart';

class Transaction {
  int id;
  String dateTime;
  double amount;
  double totalAmount;
  String cardHolder;
  String cardNumber;

  Transaction({
    this.id,
    this.dateTime,
    this.amount,
    this.totalAmount,
    this.cardHolder,
    this.cardNumber,
  });

  factory Transaction.fromJson(dynamic json) {
    return Transaction(
      id: json['id'],
      dateTime: json['dateTime'],
      amount: HttpHelper.parseWebAmount(json['amount']),
      totalAmount: HttpHelper.parseWebAmount(json['totalAmount']),
      cardHolder: json['cardHolder'] ?? "",
      cardNumber: json['cardNumber'] ?? ""
    );
  }
}

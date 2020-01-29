import 'package:flutter_money_formatter/flutter_money_formatter.dart';
import 'package:intl/intl.dart';

class Formatter {
  static String currency(double amount) {
    return FlutterMoneyFormatter(
        amount: amount,
        settings: MoneyFormatterSettings(
            symbol: '\$'
        )
    ).output.symbolOnLeft;
  }

  static String time(DateTime dateTime) {
    return DateFormat("HH:mm").format(dateTime);
  }

  static String date(DateTime dateTime) {
    return DateFormat("dd/MM/yyyy").format(dateTime);
  }

  static String relativeDate(DateTime dateTime) {
    switch (_getRelativeDateType(dateTime)) {
      case _RelativeDateType.Today: return "Today";
      case _RelativeDateType.Tomorrow: return "Tomorrow";
      case _RelativeDateType.Yesterday: return "Yesterday";
      default: return date(dateTime);
    }
  }

  static _RelativeDateType _getRelativeDateType(DateTime dateTime) {
    final DateTime now = DateTime.now();
    final DateTime today = DateTime(now.year, now.month, now.day);
    final DateTime yesterday = DateTime(now.year, now.month, now.day - 1);
    final DateTime tomorrow = DateTime(now.year, now.month, now.day + 1);

    final DateTime aDate = DateTime(dateTime.year, dateTime.month, dateTime.day);
    if (aDate == today) {
      return _RelativeDateType.Today;
    } else if (aDate == yesterday) {
      return _RelativeDateType.Yesterday;
    } else if (aDate == tomorrow) {
      return _RelativeDateType.Tomorrow;
    }

    return _RelativeDateType.Other;
  }
}

enum _RelativeDateType {
  Today, Yesterday, Tomorrow, Other
}
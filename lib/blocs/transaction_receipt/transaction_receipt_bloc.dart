import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:gogreen/models/transaction_model.dart';
import 'package:gogreen/services/services.dart';
import './bloc.dart';

class TransactionReceiptBloc extends Bloc<TransactionReceiptEvent, TransactionReceiptState> {
  final ILogService _logService;
  final ITransactionService _transactionService;
  final Transaction _transaction;

  String mReceipt;

  TransactionReceiptBloc(this._logService, this._transactionService, this._transaction);

  @override
  TransactionReceiptState get initialState => LoadingTransactionReceiptState();

  @override
  Stream<TransactionReceiptState> mapEventToState(
    TransactionReceiptEvent event,
  ) async* {
      if (event is LoadTransactionReceiptEvent) {
        mReceipt = await _transactionService.fetchReceipt(_transaction.id);
        mReceipt = _wrapHtmlStyle(mReceipt);

        yield LoadedTransactionReceiptState(mReceipt);
      }

      if (event is ShareTransactionReceiptEvent) {
        // Sharing
        _logService.d("Sharing receipt ${mReceipt.length} bytes");
      }
  }


  String _wrapHtmlStyle(String receipt) {
    return """<HEAD><STYLE type='text/css'>
      .rc {font-family: 'Courier New', monospace; font-size: 13px; width: 196px;}
      .rc-br {height: 1em; clear: both; }
      .rc-left + .rc-br, .rc-right + .rc-br, .rc-center + .rc-br {height: 2px;}
      .rc-left {max-width: 150px; text-align: left; float: left;}
      .rc-right {max-width: 150px; text-align: right; float: right;}
      .rc-center {text-align: center;}
      .rc img {max-width: 192px;}
      .parent {display: table; margin: 0 auto; text-align: center;}
      </STYLE></HEAD><BODY><div class='parent'>$receipt</div></BODY>
    """;
  }
}

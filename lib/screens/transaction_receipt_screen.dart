import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:gogreen/blocs/transaction_receipt/bloc.dart';
import 'package:gogreen/di/injector.dart';
import 'package:gogreen/models/transaction_model.dart';
import 'package:gogreen/widgets/loading_widget.dart';
import 'package:html/dom.dart' as dom;

class TransactionReceiptScreen extends StatelessWidget {
  static const String ROUTE_PATH = "/receipt";

  const TransactionReceiptScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Receipt'),
      ),
      body: BlocBuilder<TransactionReceiptBloc, TransactionReceiptState>(
          builder: (context, TransactionReceiptState state) {
        if (state is LoadingTransactionReceiptState) {
          return LoadingWidget();
        }

        if (state is LoadedTransactionReceiptState) {
          return WebviewScaffold(
            url: Uri.dataFromString(
              _wrapHtmlStyle(state.html),
              mimeType: 'text/html',
            ).toString(),
          );
        }

        return Container();
      }),
    );
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

  static Widget open(BuildContext context, TransactionReceiptArguments arg) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<TransactionReceiptBloc>(
            create: (ctx) => TransactionReceiptBloc(
                  Injector().logService,
                  Injector().transactionService,
                  arg.transaction,
                )..add(LoadTransactionReceiptEvent())),
      ],
      child: TransactionReceiptScreen(),
    );
  }
}

class TransactionReceiptArguments {
  final Transaction transaction;

  TransactionReceiptArguments(this.transaction);
}

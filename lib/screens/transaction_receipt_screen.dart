import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:gogreen/blocs/transaction_receipt/bloc.dart';
import 'package:gogreen/core/dimens.dart';
import 'package:gogreen/di/injector.dart';
import 'package:gogreen/generated/i18n.dart';
import 'package:gogreen/models/transaction_model.dart';
import 'package:gogreen/widgets/bottom_button.dart';
import 'package:gogreen/widgets/loading_widget.dart';

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
          return Container(
            child: WebviewScaffold(
              url: Uri.dataFromString(
                state.html,
                mimeType: 'text/html',
              ).toString(),
            ),
            margin:
                EdgeInsets.only(bottom: Dimens.of(context).bottomButtonHeight),
          );
        }

        return Container();
      }),
      bottomSheet: BlocBuilder<TransactionReceiptBloc, TransactionReceiptState>(
          builder: (context, TransactionReceiptState state) {
        if (state is LoadedTransactionReceiptState) {
          return BottomButton(
            text: S.of(context).share,
            onPressed: () {
              BlocProvider.of<TransactionReceiptBloc>(context)
                  .add(ShareTransactionReceiptEvent());
            },
          );
        }

        return Container();
      }),
    );
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

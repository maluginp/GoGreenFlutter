import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:gogreen/blocs/transaction_receipt/bloc.dart';
import 'package:gogreen/di/injector.dart';
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
              return SingleChildScrollView(
                  child: Html(data: state.html)
              );
            }

            return Container();
          }),
    );
  }

  static Widget open(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<TransactionReceiptBloc>(
            create: (ctx) =>
            TransactionReceiptBloc(Injector().logService,
                Injector().transactionService)
              ..add(LoadTransactionReceiptEvent())),
      ],
      child: TransactionReceiptScreen(),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gogreen/blocs/transaction_list/bloc.dart';
import 'package:gogreen/di/injector.dart';
import 'package:gogreen/models/location_model.dart';
import 'package:gogreen/models/transaction_model.dart';
import 'package:gogreen/screens/transaction_receipt_screen.dart';
import 'package:gogreen/widgets/filter_widget.dart';
import 'package:gogreen/widgets/loading_widget.dart';

class TransactionListScreen extends StatelessWidget {
  static const String ROUTE_PATH = "/transactions";

  const TransactionListScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transactions'),
      ),
      body: BlocBuilder<TransactionListBloc, TransactionListState>(
          builder: (context, TransactionListState state) {
        if (state is LoadingTransactionListState) {
          if (state.hasFilter) {
            return Row(
              children: <Widget>[FilterWidget(state.filter), LoadingWidget()],
            );
          }

          return LoadingWidget();
        }

        if (state is FetchedTransactionListState) {
          if (state.hasFilter) {
            return Row(
              children: <Widget>[
                FilterWidget(state.filter),
                _buildListView(state.transactions)
              ],
            );
          }

          return _buildListView(state.transactions);
        }

        return Container();
      }),
    );
  }

  _buildListView(List<Transaction> transactions) {
    return ListView.builder(
      itemCount: transactions.length,
      itemBuilder: (context, i) {
        var transaction = transactions[i];
        return ListTile(
          title: Text("${transaction.totalAmount}"),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            Navigator.of(context).pushNamed(
              TransactionReceiptScreen.ROUTE_PATH,
              arguments: TransactionReceiptArguments(transaction),
            );
          },
        );
      },
    );
  }

  static Widget open(BuildContext context) {
    TransactionListArguments args = ModalRoute.of(context).settings.arguments;

    return MultiBlocProvider(
      providers: [
        BlocProvider<TransactionListBloc>(
            create: (ctx) => TransactionListBloc(Injector().logService,
                Injector().transactionService, args.location)
              ..add(FetchTransactionListEvent(null))),
      ],
      child: TransactionListScreen(),
    );
  }
}

class TransactionListArguments {
  final Location location;

  TransactionListArguments(this.location);
}

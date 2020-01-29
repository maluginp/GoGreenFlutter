import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gogreen/blocs/order_lines/bloc.dart';
import 'package:gogreen/core/dimens.dart';
import 'package:gogreen/core/formatter.dart';
import 'package:gogreen/di/injector.dart';
import 'package:gogreen/models/order_models.dart';
import 'package:gogreen/models/store_models.dart';
import 'package:gogreen/widgets/loading_widget.dart';

class OrderLinesScreen extends StatelessWidget {
  static const String ROUTE_PATH = "/order_lines";

  const OrderLinesScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Order Lines'),
        ),
        body: BlocBuilder<OrderLinesBloc, OrderLinesState>(
            builder: (context, OrderLinesState state) {
          if (state is LoadingOrderLinesState) {
            return LoadingWidget();
          }

          if (state is FetchedOrderLinesState) {
            return _buildListView(state.lines);
          }

          return Container();
        }),
        bottomSheet: GestureDetector(
            onTap: () {
              BlocProvider.of<OrderLinesBloc>(context)
                  ..add(CheckoutOrderLinesEvent());
            },
            child: Container(
              height: Dimens.of(context).bottomButtonHeight,
              color: Theme.of(context).accentColor,
              child: Center(
                  child: Text('Checkout', style: Theme.of(context).accentTextTheme.button)
              ),
            )
        )
    );
  }

  _buildListView(List<OrderLineItem> lines) {
    return ListView.separated(
        itemCount: lines.length,
        itemBuilder: (context, i) {
          var line = lines[i];
          return ListTile(
            title: Text("${line.quantity}x ${line.name}"),
            trailing: Text(Formatter.currency(line.price)),
            leading: Image.network(line.image),
            onTap: () {
//            Navigator.of(context).pushNamed(TransactionListScreen.ROUTE_PATH,
//                arguments: TransactionListArguments(location));
            },
          );
        },
        separatorBuilder: (context, index) => Divider(
              color: Colors.black,
            ));
  }

  static Widget open(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<OrderLinesBloc>(
            create: (ctx) =>
                OrderLinesBloc(Injector().logService, Injector().orderService)
                  ..add(FetchOrderLinesEvent())),
      ],
      child: OrderLinesScreen(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gogreen/blocs/order_lines/bloc.dart';
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
        title: Text('Locations'),
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
    );
  }

  _buildListView(List<OrderLineItem> lines) {
    return ListView.builder(
      itemCount: lines.length,
      itemBuilder: (context, i) {
        var line = lines[i];
        return ListTile(
          title: Text(line.name),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
//            Navigator.of(context).pushNamed(TransactionListScreen.ROUTE_PATH,
//                arguments: TransactionListArguments(location));
          },
        );
      },
    );
  }

  static Widget open(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<OrderLinesBloc>(
            create: (ctx) => OrderLinesBloc(
                Injector().logService, Injector().orderService)
              ..add(FetchOrderLinesEvent())),
      ],
      child: OrderLinesScreen(),
    );
  }
}

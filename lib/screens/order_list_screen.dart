import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gogreen/blocs/order_list/bloc.dart';
import 'package:gogreen/di/injector.dart';
import 'package:gogreen/models/order_models.dart';
import 'package:gogreen/screens/screens.dart';
import 'package:gogreen/widgets/loading_widget.dart';

class OrderListScreen extends StatelessWidget {
  static const String ROUTE_PATH = "/orders";

  const OrderListScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Orders'),
      ),
      body: BlocBuilder<OrderListBloc, OrderListState>(
          builder: (context, OrderListState state) {
        if (state is LoadingOrderListState) {
          return LoadingWidget();
        }

        if (state is FetchedOrderListState) {
          return _buildListView(state.orders);
        }

        return Container();
      }),
    );
  }

  _buildListView(List<Order> orders) {
    return ListView.separated(
      itemCount: orders.length,
      itemBuilder: (context, i) {
        var order = orders[i];
        return ListTile(
          title: Text(order.name),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            Navigator.of(context).pushNamed(OrderLinesScreen.ROUTE_PATH);
          },
        );
      },
      separatorBuilder: (context, i) => Divider(
        color: Colors.black,
      ),
    );
  }

  static Widget open(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<OrderListBloc>(
            create: (ctx) => OrderListBloc(
                Injector().logService, Injector().orderHistoryService)
              ..add(FetchOrderListEvent())),
      ],
      child: OrderListScreen(),
    );
  }
}

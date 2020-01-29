import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gogreen/blocs/total_quantity_order/bloc.dart';
import 'package:gogreen/screens/screens.dart';

class TotalQuantityOrderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TotalQuantityOrderBloc, TotalQuantityOrderState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is UpdatedTotalQuantityOrderState) {
            return Container(
              color: Theme.of(context).accentColor,
                child: ListTile(
              title: Text(
                  state.totalQuantity.toString(),
                  style: Theme.of(context).accentTextTheme.button,
              ),
              trailing: Icon(
                  Icons.shopping_cart,
                  color: Theme.of(context).accentTextTheme.button.color,
              ),
              onTap: () {
                Navigator.of(context).pushNamed(OrderLinesScreen.ROUTE_PATH);
              },
            ));
          }

          return Container();
        });
  }
}

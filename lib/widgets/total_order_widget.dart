import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gogreen/blocs/total_order/bloc.dart';
import 'package:gogreen/core/dimens.dart';
import 'package:gogreen/core/formatter.dart';
import 'package:gogreen/screens/screens.dart';

class TotalOrderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TotalOrderBloc, TotalOrderState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is CalculatedTotalOrderState) {
            return GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(OrderLinesScreen.ROUTE_PATH);
              },
              child: Container(
                height: Dimens.of(context).bottomButtonHeight,
                color: Theme.of(context).accentColor,
                child: Center(
                  child: Text(
                    "Checkout ${Formatter.currency(state.totalAmount)}".toUpperCase(),
                    style: Theme.of(context).accentTextTheme.button,
                  ),
                ),
              ),
            );
          }

          return Container();
        });
  }
}

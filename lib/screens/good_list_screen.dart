import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gogreen/blocs/good_list/bloc.dart';
import 'package:gogreen/blocs/total_quantity_order/bloc.dart';
import 'package:gogreen/di/injector.dart';
import 'package:gogreen/models/store_models.dart';
import 'package:gogreen/widgets/loading_widget.dart';
import 'package:gogreen/screens/screens.dart';
import 'package:gogreen/widgets/total_quantity_order_widget.dart';

class GoodListScreen extends StatelessWidget {
  static const String ROUTE_PATH = "/goods";

  const GoodListScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Goods'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.of(context).pushNamed(OrderLinesScreen.ROUTE_PATH);
              })
        ],
      ),
      body: BlocConsumer<GoodListBloc, GoodListState>(
          listener: (context, state) {
            if (state is AddedToOrderGoodListState) {
              BlocProvider.of<TotalQuantityOrderBloc>(context).add(UpdateTotalQuantityOrderEvent());
            }
          },
          buildWhen: (prevState, nextState) {
            if (nextState is AddedToOrderGoodListState) {
              return false;
            }

            return true;
          },
          builder: (context, GoodListState state) {
        if (state is LoadingGoodListState) {
          return LoadingWidget();
        }

        if (state is FetchedGoodListState) {
          return _buildListView(state.goods);
        }

        return Container();
      }),
      bottomSheet: TotalQuantityOrderWidget(),
    );
  }

  _buildListView(List<Good> goods) {
    return ListView.builder(
      itemCount: goods.length,
      itemBuilder: (context, i) {
        var good = goods[i];
        return ListTile(
          title: Text(good.name),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            BlocProvider.of<GoodListBloc>(context)
                .add(AddGoodToOrderGoodListEvent(good));
          },
        );
      },
    );
  }

  static Widget open(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<GoodListBloc>(
            create: (ctx) => GoodListBloc(Injector().logService,
                Injector().storeService, Injector().orderService)
              ..add(FetchGoodListEvent())),
        BlocProvider<TotalQuantityOrderBloc>(
            create: (ctx) => TotalQuantityOrderBloc(
                Injector().logService, Injector().orderService)
              ..add(UpdateTotalQuantityOrderEvent())),
      ],
      child: GoodListScreen(),
    );
  }
}

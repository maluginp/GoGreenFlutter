import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gogreen/blocs/good_list/bloc.dart';
import 'package:gogreen/blocs/total_order/bloc.dart';
import 'package:gogreen/core/formatter.dart';
import 'package:gogreen/di/injector.dart';
import 'package:gogreen/models/store_models.dart';
import 'package:gogreen/widgets/icon_badge_widget.dart';
import 'package:gogreen/widgets/loading_widget.dart';
import 'package:gogreen/screens/screens.dart';
import 'package:gogreen/widgets/total_order_widget.dart';

class GoodListScreen extends StatelessWidget {
  static const String ROUTE_PATH = "/goods";

  final String title;

  const GoodListScreen(this.title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: <Widget>[
          BlocBuilder<TotalOrderBloc, TotalOrderState>(
            builder: (context, state) {
              if (state is CalculatedTotalOrderState) {
                return IconBadgeWidget(
                  badge: state.totalQuantity,
                  icon: Icons.shopping_cart,
                  onPressed: () {
                    Navigator.of(context).pushNamed(
                      OrderLinesScreen.ROUTE_PATH,
                    );
                  },
                );
              }

              return Container();
            },
          ),
        ],
      ),
      body: BlocConsumer<GoodListBloc, GoodListState>(
        listener: (context, state) {
          if (state is AddedToOrderGoodListState) {
            BlocProvider.of<TotalOrderBloc>(context).add(GetTotalOrderEvent());
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
        },
      ),
      bottomSheet: TotalOrderWidget(),
    );
  }

  _buildListView(List<Good> goods) {
    return ListView.separated(
      itemCount: goods.length,
      itemBuilder: (context, i) {
        var good = goods[i];
        return ListTile(
          title: Text(good.name),
          leading: Image.network(good.image),
          trailing: _getTrailing(good),
          onTap: () {
            if (good is! SubDepartmentGood) {
              BlocProvider.of<GoodListBloc>(context)
                  .add(AddGoodToOrderGoodListEvent(good));
            } else {
              Navigator.of(context).pushNamed(
                GoodListScreen.ROUTE_PATH,
                arguments: GoodListArgument(good.guid, good.name),
              );
            }
          },
        );
      },
      separatorBuilder: (context, index) => Divider(
        color: Colors.black,
      ),
    );
  }

  static Widget open(BuildContext context, GoodListArgument arg) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<GoodListBloc>(
          create: (ctx) => GoodListBloc(
            Injector().logService,
            Injector().storeService,
            Injector().orderService,
            arg.departmentGuid,
          )..add(FetchGoodListEvent()),
        ),
        BlocProvider<TotalOrderBloc>(
          create: (ctx) => TotalOrderBloc(
            Injector().logService,
            Injector().orderService,
          )..add(GetTotalOrderEvent()),
        ),
      ],
      child: GoodListScreen(arg.title),
    );
  }

  _getTrailing(Good good) {
    if (good is! SubDepartmentGood) {
      return Text(Formatter.currency(good.price));
    } else {
      return Icon(Icons.keyboard_arrow_right);
    }
  }
}

class GoodListArgument {
  String departmentGuid;
  String title;

  GoodListArgument(this.departmentGuid, this.title);
}

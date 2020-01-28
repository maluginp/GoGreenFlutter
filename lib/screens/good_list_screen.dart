import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gogreen/blocs/good_list/bloc.dart';
import 'package:gogreen/di/injector.dart';
import 'package:gogreen/models/store_models.dart';
import 'package:gogreen/widgets/loading_widget.dart';
import 'package:gogreen/screens/screens.dart';

class GoodListScreen extends StatelessWidget {
  static const String ROUTE_PATH = "/goods";

  const GoodListScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Goods'),
      ),
      body: BlocBuilder<GoodListBloc, GoodListState>(
          builder: (context, GoodListState state) {
        if (state is LoadingGoodListState) {
          return LoadingWidget();
        }

        if (state is FetchedGoodListState) {
          return _buildListView(state.goods);
        }

        return Container();
      }),
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
            Navigator.of(context).pushNamed(GoodListScreen.ROUTE_PATH);
          },
        );
      },
    );
  }

  static Widget open(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<GoodListBloc>(
            create: (ctx) => GoodListBloc(
                Injector().logService, Injector().storeService)
              ..add(FetchGoodListEvent())),
      ],
      child: GoodListScreen(),
    );
  }
}

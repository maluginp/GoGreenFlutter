import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gogreen/blocs/store_list/bloc.dart';
import 'package:gogreen/di/injector.dart';
import 'package:gogreen/models/store_models.dart';
import 'package:gogreen/widgets/loading_widget.dart';

//class StoreListScreen extends StatelessWidget {
//  static const String ROUTE_PATH = "/stores";
//
//  const StoreListScreen();
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text('Locations'),
//      ),
//      body: BlocBuilder<StoreListBloc, StoreListState>(
//          builder: (context, StoreListState state) {
//        if (state is LoadingStoreListState) {
//          return LoadingWidget();
//        }
//
//        if (state is FetchedStoreListState) {
//          return _buildListView(state.stores);
//        }
//
//        return Container();
//      }),
//    );
//  }
//
//  _buildListView(List<Store> locations) {
//    return ListView.builder(
//      itemCount: locations.length,
//      itemBuilder: (context, i) {
//        var location = locations[i];
//        return ListTile(
//          title: Text(location.name),
//          trailing: Icon(Icons.keyboard_arrow_right),
//          onTap: () {
////            Navigator.of(context).pushNamed(TransactionListScreen.ROUTE_PATH,
////                arguments: TransactionListArguments(location));
//          },
//        );
//      },
//    );
//  }
//
//  static Widget open(BuildContext context) {
//    return MultiBlocProvider(
//      providers: [
//        BlocProvider<StoreListBloc>(
//            create: (ctx) => StoreListBloc(
//                Injector().logService, Injector().storeLocationsService)
//              ..add(FetchStoreListEvent())),
//      ],
//      child: StoreListScreen(),
//    );
//  }
//}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gogreen/blocs/location_list/bloc.dart';
import 'package:gogreen/blocs/location_search/bloc.dart';
import 'package:gogreen/di/injector.dart';
import 'package:gogreen/models/filter_model.dart';
import 'package:gogreen/models/location_model.dart';
import 'package:gogreen/screens/transaction_list_screen.dart';
import 'package:gogreen/widgets/filter_widget.dart';
import 'package:gogreen/widgets/loading_widget.dart';

import 'screens.dart';

class LocationListScreen extends StatelessWidget {
  static const String ROUTE_PATH = "/locations";

  const LocationListScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BlocBuilder<LocationSearchBloc, LocationSearchState>(
          builder: (context, LocationSearchState state) {
            if (state is EnabledLocationSearchState) {
              return TextField(
                onChanged: (text) {
                  BlocProvider.of<LocationListBloc>(context).add(
                    FetchLocationListEvent(
                      LocationListFilter(
                        name: text,
                      ),
                    ),
                  );
                },
                autofocus: true,
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                  hintText: 'Search...',
                ),
              );
            }

            return Text('Locations');
          },
        ),
        actions: <Widget>[
          BlocBuilder<LocationSearchBloc, LocationSearchState>(
            builder: (context, LocationSearchState state) {
              if (state is EnabledLocationSearchState) {
                return IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () async {
                    BlocProvider.of<LocationSearchBloc>(context)
                        .add(CloseLocationSearchEvent());
                    BlocProvider.of<LocationListBloc>(context)
                        .add(FetchLocationListEvent(null));
                  },
                );
              }
              return IconButton(
                icon: Icon(Icons.search),
                onPressed: () async {
                  BlocProvider.of<LocationSearchBloc>(context)
                      .add(ShowLocationSearchEvent());
                  BlocProvider.of<LocationListBloc>(context).add(
                    FetchLocationListEvent(
                      LocationListFilter(
                        name: "",
                      ),
                    ),
                  );
                },
              );
            },
          ),
          BlocBuilder<LocationSearchBloc, LocationSearchState>(
            builder: (context, LocationSearchState state) {
              if (state is EnabledLocationSearchState) {
                return Container();
              }
              return IconButton(
                icon: Icon(Icons.settings),
                onPressed: () async {
                  await Navigator.of(context).pushNamed(
                    SettingsScreen.ROUTE_PATH,
                  );
                  BlocProvider.of<LocationListBloc>(context)
                      .add(FetchLocationListEvent(null));
                },
              );
            },
          )
        ],
      ),
      body: BlocBuilder<LocationListBloc, LocationListState>(
        builder: (context, LocationListState state) {
          if (state is LoadingLocationListState) {
            return LoadingWidget();
          }

          if (state is FetchedLocationListState) {
            return _buildListView(state.locations);
          }

          return Container();
        },
      ),
    );
  }

  _buildListView(List<Location> locations) {
    if (locations.isEmpty) {
      return Center(
        child: Text('Empty'),
      );
    }
    return ListView.builder(
      physics: ScrollPhysics(),
      shrinkWrap: true,
      itemCount: locations.length,
      itemBuilder: (context, i) {
        var location = locations[i];
        return ListTile(
          title: Text(location.name),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            Navigator.of(context).pushNamed(TransactionListScreen.ROUTE_PATH,
                arguments: TransactionListArguments(location));
          },
        );
      },
    );
  }

  static Widget open(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LocationListBloc>(
          create: (ctx) => LocationListBloc(
            Injector().logService,
            Injector().locationService,
          )..add(FetchLocationListEvent(null)),
        ),
        BlocProvider<LocationSearchBloc>(
          create: (ctx) => LocationSearchBloc(),
        ),
      ],
      child: LocationListScreen(),
    );
  }
}

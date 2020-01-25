import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gogreen/blocs/location_list/bloc.dart';
import 'package:gogreen/di/injector.dart';
import 'package:gogreen/models/location_model.dart';
import 'package:gogreen/widgets/filter_widget.dart';
import 'package:gogreen/widgets/loading_widget.dart';

class LocationListScreen extends StatelessWidget {
  const LocationListScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Locations'),
      ),
      body: BlocBuilder<LocationListBloc, LocationListState>(
          builder: (context, LocationListState state) {
        if (state is LoadingLocationListState) {
          if (state.hasFilter) {
            return Row(
              children: <Widget>[FilterWidget(state.filter), LoadingWidget()],
            );
          }

          return LoadingWidget();
        }

        if (state is FetchedLocationListState) {
          if (state.hasFilter) {
            return Row(
              children: <Widget>[
                FilterWidget(state.filter),
                _buildListView(state.locations)
              ],
            );
          }

          return _buildListView(state.locations);
        }

        return Container();
      }),
    );
  }

  _buildListView(List<Location> locations) {
    return ListView.builder(
      itemCount: locations.length,
      itemBuilder: (context, i) {
        var location = locations[i];
        return ListTile(
          title: Text(location.name),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            Navigator.of(context)
                .pushNamed('/transactions', arguments: location);
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
                Injector().logService, Injector().locationService)
              ..add(FetchLocationListEvent(null))),
      ],
      child: LocationListScreen(),
    );
  }
}

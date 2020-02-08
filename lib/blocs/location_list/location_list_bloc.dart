import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:gogreen/models/location_model.dart';
import 'package:gogreen/services/location_service.dart';
import 'package:gogreen/services/log_service.dart';
import './bloc.dart';

class LocationListBloc extends Bloc<LocationListEvent, LocationListState> {
  final ILogService _logService;
  final ILocationService _locationService;

  LocationListBloc(this._logService, this._locationService);

  @override
  LocationListState get initialState => LoadingLocationListState(null);

  @override
  Stream<LocationListState> mapEventToState(
    LocationListEvent event,
  ) async* {
      if (event is FetchLocationListEvent) {
        _logService.d('Fetch locations with filter=${event.filter}');
        yield LoadingLocationListState(event.filter);

        List<Location> locations = [];
        if (event.filter == null) {
           locations = await _locationService.fetchLocations(event.filter, 1);
        } else if (event.filter.name.length >= 3) {
          locations = await _locationService.fetchLocations(event.filter, 1);
        }

        yield FetchedLocationListState(event.filter, locations);
      }
  }
}

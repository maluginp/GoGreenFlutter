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

        List<Location> locations = await _locationService.fetchLocations(event.filter);

        yield FetchedLocationListState(event.filter, locations);
      }
  }
}

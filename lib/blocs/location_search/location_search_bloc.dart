import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';

class LocationSearchBloc extends Bloc<LocationSearchEvent, LocationSearchState> {
  @override
  LocationSearchState get initialState => DisabledLocationSearchState();

  @override
  Stream<LocationSearchState> mapEventToState(
    LocationSearchEvent event,
  ) async* {
    if (event is ShowLocationSearchEvent) {
      yield EnabledLocationSearchState();
    }

    if (event is CloseLocationSearchEvent) {
      yield DisabledLocationSearchState();
    }
  }
}

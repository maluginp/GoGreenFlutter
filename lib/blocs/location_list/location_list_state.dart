import 'package:equatable/equatable.dart';
import 'package:gogreen/models/filter_model.dart';
import 'package:gogreen/models/location_model.dart';

abstract class LocationListState extends Equatable {
  const LocationListState();
}



class LoadingLocationListState extends LocationListState {
  final LocationListFilter filter;

  LoadingLocationListState(this.filter);

  bool get hasFilter => this.filter != null;

  @override
  List<Object> get props => [filter];

}


class FetchedLocationListState extends LocationListState {
  final LocationListFilter filter;
  final List<Location> locations;

  FetchedLocationListState(this.filter, this.locations);

  bool get hasFilter => this.filter != null;

  @override
  List<Object> get props => [filter, locations];
}

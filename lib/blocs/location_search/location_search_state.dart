import 'package:equatable/equatable.dart';

abstract class LocationSearchState extends Equatable {
  const LocationSearchState();
}

class DisabledLocationSearchState extends LocationSearchState {
  @override
  List<Object> get props => [];
}

class EnabledLocationSearchState extends LocationSearchState {
  @override
  List<Object> get props => [];
}
import 'package:equatable/equatable.dart';

abstract class LocationSearchEvent extends Equatable {
  const LocationSearchEvent();
}

class ShowLocationSearchEvent extends LocationSearchEvent {
  const ShowLocationSearchEvent();

  @override
  List<Object> get props => [];
}

class CloseLocationSearchEvent extends LocationSearchEvent {
  const CloseLocationSearchEvent();

  @override
  List<Object> get props => [];
}
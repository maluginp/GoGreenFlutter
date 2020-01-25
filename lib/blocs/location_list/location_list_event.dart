import 'package:equatable/equatable.dart';
import 'package:gogreen/models/filter_model.dart';

abstract class LocationListEvent extends Equatable {
  const LocationListEvent();
}

class FetchLocationListEvent extends LocationListEvent {
  final LocationListFilter filter;

  FetchLocationListEvent(this.filter);

  @override
  List<Object> get props => [filter];

}


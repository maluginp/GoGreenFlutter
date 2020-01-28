import 'package:equatable/equatable.dart';

abstract class StoreListEvent extends Equatable {
  const StoreListEvent();
}

class FetchStoreListEvent extends StoreListEvent {
  @override
  List<Object> get props => [];
}

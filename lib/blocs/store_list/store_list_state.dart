import 'package:equatable/equatable.dart';
import 'package:gogreen/models/store_models.dart';

abstract class StoreListState extends Equatable {
  const StoreListState();
}

class LoadingStoreListState extends StoreListState {
  @override
  List<Object> get props => [];
}

class FetchedStoreListState extends StoreListState {
  final List<Store> stores;

  FetchedStoreListState(this.stores);

  @override
  List<Object> get props => [];
}
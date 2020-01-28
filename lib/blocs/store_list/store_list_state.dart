import 'package:equatable/equatable.dart';

abstract class StoreListState extends Equatable {
  const StoreListState();
}

class InitialStoreListState extends StoreListState {
  @override
  List<Object> get props => [];
}

import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';

class StoreListBloc extends Bloc<StoreListEvent, StoreListState> {
  @override
  StoreListState get initialState => InitialStoreListState();

  @override
  Stream<StoreListState> mapEventToState(
    StoreListEvent event,
  ) async* {
    // TODO: Add Logic
  }
}

import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:gogreen/models/store_models.dart';
import 'package:gogreen/services/services.dart';
import './bloc.dart';

class StoreListBloc extends Bloc<StoreListEvent, StoreListState> {
  final ILogService _logService;
  final IStoreLocationsService _storeLocationsService;

  StoreListBloc(this._logService, this._storeLocationsService);

  @override
  StoreListState get initialState => LoadingStoreListState();

  @override
  Stream<StoreListState> mapEventToState(
    StoreListEvent event,
  ) async* {
    if (event is FetchStoreListEvent) {
      List<Store> stores = await _storeLocationsService.fetchStores();
      yield FetchedStoreListState(stores);
    }
  }
}

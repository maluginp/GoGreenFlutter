import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';

class GoodListBloc extends Bloc<GoodListEvent, GoodListState> {
  @override
  GoodListState get initialState => InitialGoodListState();

  @override
  Stream<GoodListState> mapEventToState(
    GoodListEvent event,
  ) async* {
    // TODO: Add Logic
  }
}

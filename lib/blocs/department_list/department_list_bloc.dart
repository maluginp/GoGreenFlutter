import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';

class DepartmentListBloc extends Bloc<DepartmentListEvent, DepartmentListState> {
  @override
  DepartmentListState get initialState => InitialDepartmentListState();

  @override
  Stream<DepartmentListState> mapEventToState(
    DepartmentListEvent event,
  ) async* {
    // TODO: Add Logic
  }
}

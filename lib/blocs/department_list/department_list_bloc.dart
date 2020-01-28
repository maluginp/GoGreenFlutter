import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:gogreen/models/store_models.dart';
import 'package:gogreen/services/services.dart';
import './bloc.dart';

class DepartmentListBloc extends Bloc<DepartmentListEvent, DepartmentListState> {
  final ILogService _logService;
  final IStoreService _storeService;

  DepartmentListBloc(this._logService, this._storeService);

  @override
  DepartmentListState get initialState => LoadingDepartmentListState();

  @override
  Stream<DepartmentListState> mapEventToState(
    DepartmentListEvent event,
  ) async* {
    if (event is FetchDepartmentListEvent) {
      List<Department> departments = await _storeService.fetchDepartments();
      yield FetchedDepartmentListState(departments);
    }
  }
}

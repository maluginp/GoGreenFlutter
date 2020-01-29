import 'package:equatable/equatable.dart';
import 'package:gogreen/models/store_models.dart';

abstract class DepartmentListState extends Equatable {
  const DepartmentListState();
}

class LoadingDepartmentListState extends DepartmentListState {
  @override
  List<Object> get props => [];
}

class FetchedDepartmentListState extends DepartmentListState {
  final List<Department> departments;

  FetchedDepartmentListState(this.departments);

  @override
  List<Object> get props => [this.departments.length];
}
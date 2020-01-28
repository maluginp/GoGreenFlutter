import 'package:equatable/equatable.dart';

abstract class DepartmentListState extends Equatable {
  const DepartmentListState();
}

class InitialDepartmentListState extends DepartmentListState {
  @override
  List<Object> get props => [];
}

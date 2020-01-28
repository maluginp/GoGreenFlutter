import 'package:equatable/equatable.dart';

abstract class DepartmentListEvent extends Equatable {
  const DepartmentListEvent();
}

class FetchDepartmentListEvent extends DepartmentListEvent {

  @override
  List<Object> get props => [];
}
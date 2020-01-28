import 'package:equatable/equatable.dart';

abstract class GoodListState extends Equatable {
  const GoodListState();
}

class InitialGoodListState extends GoodListState {
  @override
  List<Object> get props => [];
}

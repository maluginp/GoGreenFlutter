import 'package:equatable/equatable.dart';

import 'modifier_list_model.dart';

abstract class ModifierListState extends Equatable {
  const ModifierListState();
}

class LoadingModifierListState extends ModifierListState {
  @override
  List<Object> get props => [];
}

class FetchedModifierListState extends ModifierListState {
  final List<CheckedModifier> modifiers;

  FetchedModifierListState(this.modifiers);

  @override
  List<Object> get props => [];
}
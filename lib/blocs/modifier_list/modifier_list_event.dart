import 'package:equatable/equatable.dart';
import 'package:gogreen/models/order_models.dart';
import 'package:gogreen/models/store_models.dart';

abstract class ModifierListEvent extends Equatable {
  const ModifierListEvent();
}

class FetchModifierListEvent extends ModifierListEvent {
  final List<OrderLineItemModifier> lineItemModifiers;

  FetchModifierListEvent(this.lineItemModifiers);

  @override
  List<Object> get props => [];
}


class SetCheckedOptionListEvent extends ModifierListEvent {
  final String optionCheckedGuid;
  final bool checked;

  SetCheckedOptionListEvent(this.optionCheckedGuid, this.checked);

  @override
  List<Object> get props => [optionCheckedGuid, checked];

}
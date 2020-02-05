import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:gogreen/core/helpers.dart';
import 'package:gogreen/models/order_models.dart';
import 'package:gogreen/models/store_models.dart';
import 'package:gogreen/services/services.dart';
import './bloc.dart';

class ModifierListBloc extends Bloc<ModifierListEvent, ModifierListState> {
  final ILogService _logService;
  final IStoreService _storeService;

  List<CheckedModifier> mCheckedModifiers = [];

  ModifierListBloc(this._logService, this._storeService);

  @override
  ModifierListState get initialState => LoadingModifierListState();

  @override
  Stream<ModifierListState> mapEventToState(ModifierListEvent event,) async* {
    if (event is FetchModifierListEvent) {
      List<OrderLineItemModifier> lineItemModifiers = event.lineItemModifiers;

      List<Modifier> modifiers = await _storeService.fetchModifiersForGood("");

      mCheckedModifiers = modifiers.map((modifier) {
        OrderLineItemModifier lineItemModifier = lineItemModifiers
            .firstWhere((el) => el.guid == modifier.guid, orElse: () {
          return OrderLineItemModifier()
            ..guid = GuidHelper.generate()
            ..modifierGuid = modifier.guid
            ..options = List();
        },);

        List<OptionChecked> options = modifier.options
            .map((o) {
          OrderLineItemOption lineItemOption = lineItemModifier.options
              .firstWhere((el) => el.optionGuid == o.guid, orElse: () => null);

          if (lineItemOption == null) {
            return OptionChecked(GuidHelper.generate(), o, false);
          } else {
            return OptionChecked(lineItemOption.guid, o, true);
          }
        });

        return CheckedModifier(lineItemModifier.guid, modifier, options);
      });

      yield FetchedModifierListState(mCheckedModifiers);
    }

    if (event is SetCheckedOptionListEvent) {
      mCheckedModifiers.forEach((modifier) => modifier.options.forEach((option) {
        if (option.guid == event.optionCheckedGuid) {
          option.checked = event.checked;
        }
      }));

      yield FetchedModifierListState(mCheckedModifiers);
    }
  }
}

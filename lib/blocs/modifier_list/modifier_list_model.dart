import 'package:gogreen/models/store_models.dart';

class CheckedModifier {
  final String guid;
  final Modifier modifier;
  final List<OptionChecked> options;

  CheckedModifier(this.guid, this.modifier, this.options);
}

class OptionChecked {
  final String guid;
  final Option option;
  bool checked;

  OptionChecked(this.guid, this.option, this.checked);
}
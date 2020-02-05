import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gogreen/blocs/modifier_list/bloc.dart';
import 'package:gogreen/di/injector.dart';
import 'package:gogreen/models/order_models.dart';
import 'package:gogreen/widgets/loading_widget.dart';

class ModifierListScreen extends StatelessWidget {
  static const String ROUTE_PATH = "/modifiers";

  const ModifierListScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Modifiers'),
      ),
      body: BlocBuilder<ModifierListBloc, ModifierListState>(
        builder: (context, ModifierListState state) {
          if (state is LoadingModifierListState) {
            return LoadingWidget();
          }

          if (state is FetchedModifierListState) {
            return _buildListView(state.modifiers);
          }

          return Container();
        },
      ),
    );
  }

  _buildListView(List<CheckedModifier> modifiers) {
    List<_Row> rows = _prepareRows(modifiers);

    return ListView.separated(
      itemCount: rows.length,
      itemBuilder: (context, i) {
        return rows[i].build(context);
      },
      separatorBuilder: (context, i) => Divider(
        color: Colors.black,
      ),
    );
  }

  static Widget open(BuildContext context, ModifierListArgument arg) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ModifierListBloc>(
          create: (ctx) => ModifierListBloc(
            Injector().logService,
            Injector().storeService,
          )..add(FetchModifierListEvent(arg.modifiers)),
        ),
      ],
      child: ModifierListScreen(),
    );
  }

  List<_Row> _prepareRows(List<CheckedModifier> modifiers) {
    List<_Row> rows = [];

    modifiers.forEach((modifier) {
      rows.add(_ModifierRow(modifier.modifier.name));

      modifier.options.forEach((option) {
        rows.add(_OptionRow(option));
      });
    });

    return rows;
  }
}

class ModifierListArgument {
  List<OrderLineItemModifier> modifiers;

  ModifierListArgument(this.modifiers);
}

abstract class _Row {
  Widget build(BuildContext context);
}

class _ModifierRow extends _Row {
  final String _name;

  _ModifierRow(this._name);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(_name),
      color: Colors.grey,
    );
  }
}

class _OptionRow extends _Row {
  final OptionChecked _optionChecked;

  _OptionRow(this._optionChecked);

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: Text(_optionChecked.option.name),
      value: _optionChecked.checked,
      controlAffinity: ListTileControlAffinity.leading,
      secondary: Icon(Icons.keyboard_arrow_right),
      onChanged: (value) {
        BlocProvider.of<ModifierListBloc>(context).add(
          SetCheckedOptionListEvent(_optionChecked.guid, value),
        );
      },
    );
  }
}

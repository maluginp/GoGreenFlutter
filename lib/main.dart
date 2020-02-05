import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'generated/i18n.dart';
import 'gogreen_theme.dart';
import 'screens/screens.dart';


void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();

  runApp(MyApp());
}

class SimpleBlocDelegate extends BlocDelegate {
  @override
  onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print(transition);
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: GoGreenTheme.theme,
      localizationsDelegates: [S.delegate],
      supportedLocales: S.delegate.supportedLocales,
      initialRoute: '/',
      routes: {
        '/': (ctx) => LoginScreen.open(ctx),
        LocationListScreen.ROUTE_PATH: (ctx) => LocationListScreen.open(ctx),
        TransactionListScreen.ROUTE_PATH: (ctx) => TransactionListScreen.open(ctx),
        TransactionReceiptScreen.ROUTE_PATH: (ctx) => TransactionReceiptScreen.open(ctx),
        StoreListScreen.ROUTE_PATH: (ctx) => StoreListScreen.open(ctx),
        DepartmentListScreen.ROUTE_PATH: (ctx) => DepartmentListScreen.open(ctx),
        GoodListScreen.ROUTE_PATH: (ctx) => GoodListScreen.open(ctx, _getArg(ctx)),
        OrderLinesScreen.ROUTE_PATH: (ctx) => OrderLinesScreen.open(ctx),
        OrderListScreen.ROUTE_PATH: (ctx) => OrderListScreen.open(ctx),
        ModifierListScreen.ROUTE_PATH: (ctx) => ModifierListScreen.open(ctx, ModifierListArgument([])),
        DocumentScreen.ROUTE_PATH: (ctx) => DocumentScreen.open(ctx, _getArg(ctx))

      }
    );
  }

  _getArg(ctx) {
    return ModalRoute.of(ctx).settings.arguments;
  }
}
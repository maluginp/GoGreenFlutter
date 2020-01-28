import 'package:flutter/material.dart';

import 'generated/i18n.dart';
import 'screens/screens.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      localizationsDelegates: [S.delegate],
      supportedLocales: S.delegate.supportedLocales,
      initialRoute: '/',
      routes: {
        '/': (ctx) => LoginScreen.open(ctx),
        '/locations': (ctx) => LocationListScreen.open(ctx),
        TransactionListScreen.ROUTE_PATH: (ctx) => TransactionListScreen.open(ctx),
        TransactionReceiptScreen.ROUTE_PATH: (ctx) => TransactionReceiptScreen.open(ctx),
        StoreListScreen.ROUTE_PATH: (ctx) => StoreListScreen.open(ctx),
        DepartmentListScreen.ROUTE_PATH: (ctx) => DepartmentListScreen.open(ctx),
        GoodListScreen.ROUTE_PATH: (ctx) => GoodListScreen.open(ctx),
        OrderLinesScreen.ROUTE_PATH: (ctx) => OrderLinesScreen.open(ctx),
        OrderListScreen.ROUTE_PATH: (ctx) => OrderListScreen.open(ctx)
      }
    );
  }
}
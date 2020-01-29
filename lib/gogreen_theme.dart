import 'package:flutter/material.dart';

class GoGreenTheme {
  static ThemeData theme = ThemeData(
      primarySwatch: Colors.green,
      textTheme: _textTheme,
      accentColor: Colors.green,
      accentTextTheme: _accentTextTheme,
      buttonTheme: ButtonThemeData(
        buttonColor: Colors.green,
        textTheme: ButtonTextTheme.primary
      )
  );

  static const _regular = FontWeight.w400;
  static const _medium = FontWeight.w500;
  static const _semiBold = FontWeight.w600;
  static const _bold = FontWeight.w700;

  static const _montserrat = 'Montserrat';
  static const _oswald = 'Oswald';

  static TextTheme _textTheme = TextTheme(
      display1: TextStyle(
        fontFamily: _montserrat,
        fontWeight: _bold,
        fontSize: 20.0,
      )
  );

  static TextTheme _accentTextTheme = TextTheme(
      button: TextStyle(
        fontFamily: _montserrat,
        color: Colors.white,
        fontWeight: _regular,
      )
  );
}
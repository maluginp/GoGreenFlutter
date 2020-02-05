import 'package:flutter/material.dart';
import 'package:gogreen/screens/login_screen.dart';

abstract class INavigationService {
  final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();

  Future<dynamic> navigateTo(String routeName);
  Future<dynamic> replaceTo(String routeName);
  Future<dynamic> logout();
}

class NavigationService extends INavigationService {

  Future<dynamic> navigateTo(String routeName) {
    return navigatorKey.currentState.pushNamed(routeName);
  }

  Future<dynamic> replaceTo(String routeName) {
    return navigatorKey.currentState.pushReplacementNamed(routeName);
  }

  Future<dynamic> logout() {
    return replaceTo(LoginScreen.ROUTE_PATH);
  }
}
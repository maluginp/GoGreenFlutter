import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gogreen/blocs/login/bloc.dart';
import 'package:gogreen/di/injector.dart';
import 'package:gogreen/screens/screens.dart';
import 'package:gogreen/widgets/loading_widget.dart';
import 'package:gogreen/widgets/login_widget.dart';

class LoginScreen extends StatelessWidget {
  static const String ROUTE_PATH = "/";

  const LoginScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: BlocConsumer<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is SignedInLoginState) {
            Navigator.of(context).pushReplacementNamed(
              LocationListScreen.ROUTE_PATH,
            );
//            Navigator.of(context).pushReplacementNamed(
//              StoreListScreen.ROUTE_PATH,
//            );
          }
        },
        builder: (context, state) {
          if (state is NotSignedInLoginState) {
            return Container(
              padding: EdgeInsets.all(16.0),
              child: LoginWidget(),
            );
          }

          return LoadingWidget();
        },
      ),
    );
  }

  static Widget open(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginBloc>(
          create: (ctx) => LoginBloc(
              Injector().logService,
              Injector().authService,
              Injector().errorService(context),
              Injector().alertService(context))
            ..add(CheckLoginEvent()),
        ),
      ],
      child: LoginScreen(),
    );
  }
}

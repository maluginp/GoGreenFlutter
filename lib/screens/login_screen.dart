import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gogreen/blocs/login/bloc.dart';
import 'package:gogreen/widgets/login_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: BlocBuilder<LoginBloc, LoginState>(
          builder: (context, LoginState state) {

            if (state is InitialLoginState) {
              return LoginWidget();
            }

            return Container();
          }),
    );
  }

  static Widget open(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginBloc>(create: (ctx) => LoginBloc()),
      ],
      child: LoginScreen(),
    );
  }
}
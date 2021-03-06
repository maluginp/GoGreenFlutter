import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gogreen/blocs/login/bloc.dart';
import 'package:gogreen/generated/i18n.dart';

class LoginWidget extends StatefulWidget {

  @override
  State createState() => _LoginState();
}

class _LoginData {
  String username = '';
  String password = '';
}

class _LoginState extends State<StatefulWidget> {
  final _formKey = GlobalKey<FormState>();

  _LoginData _data = _LoginData();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            keyboardType: TextInputType.text,
            validator: (value) {
              if (value.isEmpty) {
                return S.of(context).validation_required;
              }
              return null;
            },
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Username',
                labelText: 'Username'),
            onSaved: (value) => this._data.username = value,
          ),
          TextFormField(
            obscureText: true,
            keyboardType: TextInputType.text,
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Password',
                labelText: 'Password'),
            onSaved: (value) => this._data.password = value,
            onChanged: (value) => this._formKey.currentState.validate(),
          ),
          RaisedButton(child: Text('Sign In'), onPressed: submit)
        ],
      ),
    );
  }

  void submit() {

    if (this._formKey.currentState.validate()) {
      _formKey.currentState.save(); // Save our form now.

      BlocProvider.of<LoginBloc>(context)
          .add(SignInLoginEvent(this._data.username, this._data.password));

    }
  }
}

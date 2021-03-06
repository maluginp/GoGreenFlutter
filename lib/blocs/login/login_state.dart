import 'package:equatable/equatable.dart';

abstract class LoginState extends Equatable {
  const LoginState();
}

class InitialLoginState extends LoginState {
  @override
  List<Object> get props => [];
}

class NotSignedInLoginState extends LoginState {

  @override
  List<Object> get props => [];
}

class SignedInLoginState extends LoginState {

  @override
  List<Object> get props => [];
}
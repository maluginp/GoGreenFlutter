import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
}

class SignInLoginEvent extends LoginEvent {
  final String username;
  final String password;

  const SignInLoginEvent(this.username, this.password);

  @override
  List<Object> get props => [username, password];
}



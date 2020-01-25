import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:gogreen/services/log_service.dart';
import './bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final ILogService _logService;

  LoginBloc(this._logService);

  @override
  LoginState get initialState => InitialLoginState();

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {

    if (event is SignInLoginEvent) {
      SignInLoginEvent signInLoginEvent = event;
      _logService.d('Try to sign in as "${signInLoginEvent.username}"');
    }

    // TODO: Add Logic
  }
}

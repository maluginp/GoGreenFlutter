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
      _logService.d('Try to sign in as "${event.username}"');

      yield SignedInLoginState();
    }

    // TODO: Add Logic
  }
}

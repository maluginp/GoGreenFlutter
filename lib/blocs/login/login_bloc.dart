import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:gogreen/services/services.dart';
import './bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final ILogService _logService;
  final IAuthService _authService;

  LoginBloc(this._logService, this._authService);

  @override
  LoginState get initialState => InitialLoginState();

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {

    if (event is CheckLoginEvent) {
      var isAuthorised = await _authService.isAuthorised();

      if (isAuthorised) {
        yield SignedInLoginState();
      } else {
        yield NotSignedInLoginState();
      }

    }

    if (event is SignInLoginEvent) {
      _logService.d('Try to sign in as "${event.username}"');

      var isAuthorised = await _authService.auth(event.username, event.password);

      if (isAuthorised) {
        yield SignedInLoginState();
      }
    }

    // TODO: Add Logic
  }
}

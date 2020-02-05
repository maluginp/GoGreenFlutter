import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:gogreen/services/services.dart';
import './bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final ILogService _logService;
  final IAuthService _authService;
  final IErrorService _errorService;
  final IAlertService _alertService;

  LoginBloc(this._logService, this._authService, this._errorService, this._alertService);

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

      try {
        await _authService.auth(event.username, event.password);

        yield SignedInLoginState();
      } on Exception catch (ex) {
        _alertService.showError(_errorService.getMessage(ex));
      }
    }

    // TODO: Add Logic
  }
}

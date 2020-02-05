import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:gogreen/services/services.dart';
import './bloc.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final ILogService _logService;
  final IAuthService _authService;

  SettingsBloc(this._logService, this._authService);

  @override
  SettingsState get initialState => LoadingSettingsState();

  @override
  Stream<SettingsState> mapEventToState(
    SettingsEvent event,
  ) async* {
    if (event is FetchSettingsEvent) {
      yield LoadedSettingsState();
    }

    if (event is LogoutSettingsEvent) {
      await _authService.logout();

      yield LoggedOutSettingState();
    }
  }
}

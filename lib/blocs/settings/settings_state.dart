import 'package:equatable/equatable.dart';

abstract class SettingsState extends Equatable {
  const SettingsState();
}

class LoadingSettingsState extends SettingsState {
  @override
  List<Object> get props => [];
}

class LoadedSettingsState extends SettingsState {
  @override
  List<Object> get props => [];
}

class LoggedOutSettingState extends SettingsState {
  @override
  List<Object> get props => [];
}
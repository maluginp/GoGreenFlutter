import 'package:equatable/equatable.dart';

abstract class SettingsEvent extends Equatable {
  const SettingsEvent();
}

class FetchSettingsEvent extends SettingsEvent {
  @override
  List<Object> get props => [];
}

class LogoutSettingsEvent extends SettingsEvent {
  @override
  List<Object> get props => [];
}
abstract class SettingsState {}

class SettingsInitial extends SettingsState {}

class SettingsLoading extends SettingsState {}

class SettingsSuccess extends SettingsState {
  // final result;
  // Success(this.result);
}

class SettingsFailure extends SettingsState {
  final String error;
  SettingsFailure(this.error);
}

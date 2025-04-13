import 'package:flutter_bloc/flutter_bloc.dart';
import 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit() : super(SettingsInitial());

  Future<void> doSomething() async {
    emit(SettingsLoading());
    try {
      // Call usecase
      // emit(SettingsSuccess(result));
    } catch (e) {
      emit(SettingsFailure(e.toString()));
    }
  }
}

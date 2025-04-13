import 'package:flutter_bloc/flutter_bloc.dart';
import 'focus_mode_state.dart';

class Focus_modeCubit extends Cubit<Focus_modeState> {
  Focus_modeCubit() : super(Focus_modeInitial());

  Future<void> doSomething() async {
    emit(Focus_modeLoading());
    try {
      // Call usecase
      // emit(Focus_modeSuccess(result));
    } catch (e) {
      emit(Focus_modeFailure(e.toString()));
    }
  }
}

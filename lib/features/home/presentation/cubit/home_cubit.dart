import 'package:flutter_bloc/flutter_bloc.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  Future<void> doSomething() async {
    emit(HomeLoading());
    try {
      // Call usecase
      // emit(HomeSuccess(result));
    } catch (e) {
      emit(HomeFailure(e.toString()));
    }
  }
}

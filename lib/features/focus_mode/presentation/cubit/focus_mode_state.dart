abstract class Focus_modeState {}

class Focus_modeInitial extends Focus_modeState {}

class Focus_modeLoading extends Focus_modeState {}

class Focus_modeSuccess extends Focus_modeState {
  // final result;
  // Success(this.result);
}

class Focus_modeFailure extends Focus_modeState {
  final String error;
  Focus_modeFailure(this.error);
}

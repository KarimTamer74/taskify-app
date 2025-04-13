abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeSuccess extends HomeState {
  // final result;
  // Success(this.result);
}

class HomeFailure extends HomeState {
  final String error;
  HomeFailure(this.error);
}

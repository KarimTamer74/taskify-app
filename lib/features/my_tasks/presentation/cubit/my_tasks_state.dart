import 'package:todo_app/features/add_task/data/models/task_data_model.dart';

abstract class MyTasksState {}

class MyTasksInitial extends MyTasksState {}

class MyTasksLoading extends MyTasksState {}

class GetAllTasksSuccess extends MyTasksState {
  final List<TaskDataModel> tasks;
  GetAllTasksSuccess({required this.tasks});
}

class GetTasksByDateSuccess extends MyTasksState {
  final List<TaskDataModel> tasks;
  GetTasksByDateSuccess({required this.tasks});
}

class DeleteTaskSuccess extends MyTasksState {}

class UpdateTaskSuccess extends MyTasksState {}

class EditTaskSuccess extends MyTasksState {}
class MyTasksFailure extends MyTasksState {
  final String error;
  MyTasksFailure(this.error);
}

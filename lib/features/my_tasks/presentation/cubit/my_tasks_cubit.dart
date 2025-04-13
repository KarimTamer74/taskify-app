import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/core/db/db_helper.dart';
import 'package:todo_app/features/add_task/data/models/task_data_model.dart';

import 'my_tasks_state.dart';

class MyTasksCubit extends Cubit<MyTasksState> {
  MyTasksCubit() : super(MyTasksInitial());

  String formattedDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
  List<TaskDataModel> tasks = [];

  void acceptSelectedDate({
    required String date,
  }) {
    formattedDate = date;
    log("in acceptSelectedDate cubit formattedDate: $formattedDate");
  }

  Future<List<TaskDataModel>> getAllTasks() async {
    try {
      tasks = await DbHelper.getAllTasks();
      emit(GetAllTasksSuccess(tasks: tasks));
      log("in getAllTasks cubit tasks: $tasks");
      return tasks;
    } catch (e) {
      log("in getAllTasks cubit an error: $e");
      emit(MyTasksFailure(e.toString()));
    }
    return tasks;
  }

  Future<List<TaskDataModel>> getTasksByDate() async {
    try {
      tasks = await DbHelper.getTasksByDate(formattedDate);
      emit(GetTasksByDateSuccess(tasks: tasks));
      log("in getTasksByDate cubit tasks: $tasks");
      return tasks;
    } catch (e) {
      log("in getTasksByDate cubit an error: $e");
      emit(MyTasksFailure(e.toString()));
    }
    return tasks;
  }

  Future<void> deleteTask(int id) async {
    try {
      await DbHelper.deleteTask(id);
      emit(DeleteTaskSuccess());
      log("in deleteTask cubit tasks: tasks deleted by id: $id");
      getTasksByDate();
    } catch (e) {
      log("in deleteTask cubit an error: $e");
      emit(MyTasksFailure(e.toString()));
    }
  }

  Future<void> updateTask({required int id, required int value}) async {
    try {
      await DbHelper.updateTask(id, value);
      emit(UpdateTaskSuccess());
      log("in updateTask cubit tasks: tasks updated by id: $id");
      getTasksByDate();
    } catch (e) {
      log("in updateTask cubit an error: $e");
      emit(MyTasksFailure(e.toString()));
    }
  }

  Future<void> editTask(TaskDataModel task) async {
    try {
      await DbHelper.editTask(task);
      emit(EditTaskSuccess());
      log("in editTask cubit tasks: tasks updated by id: ${task.homeTaskDataModel.id}");
      getTasksByDate();
    } catch (e) {
      log("in editTask cubit an error: $e");
      emit(MyTasksFailure(e.toString()));
    }
  }
}

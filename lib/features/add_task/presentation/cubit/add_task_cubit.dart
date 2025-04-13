import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/core/db/db_helper.dart';
import 'package:todo_app/features/add_task/data/models/task_data_model.dart';
import 'package:todo_app/features/add_task/presentation/cubit/add_task_state.dart';

class AddTaskCubit extends Cubit<AddTaskState> {
  AddTaskCubit() : super(AddTaskInitial());

  Future<void> addTask({required TaskDataModel task}) async {
    emit(AddTaskLoading());
    try {
      await DbHelper.insertTask(task);
      emit(AddTaskSuccess());
      log("in add task cubitTask added successfully with task data ${task.toMap()}");
    } catch (e) {
      emit(AddTaskFailure(e.toString()));
      log("in add task cubitTask added failed with error ${e.toString()}");
    }
  }
}

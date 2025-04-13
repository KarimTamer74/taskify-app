import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/core/shared_widgets/custom_app_bar.dart';
import 'package:todo_app/core/utils/app_strings.dart';
import 'package:todo_app/features/add_task/presentation/cubit/add_task_cubit.dart';
import 'package:todo_app/features/add_task/presentation/widgets/add_task_view_body.dart';

class AddTaskView extends StatelessWidget {
  const AddTaskView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: AppStrings.addTask,
      ),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: BlocProvider(
          create: (context) => AddTaskCubit(),
          child: AddTaskViewBody(),
        ),
      )),
    );
  }
}

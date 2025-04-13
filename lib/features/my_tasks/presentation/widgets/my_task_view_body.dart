import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/core/extensions/sizedbox_extensions.dart';
import 'package:todo_app/core/shared_widgets/show_snackbar_widget.dart';
import 'package:todo_app/core/utils/app_strings.dart';
import 'package:todo_app/features/add_task/data/models/task_data_model.dart';
import 'package:todo_app/features/my_tasks/presentation/cubit/my_tasks_cubit.dart';
import 'package:todo_app/features/my_tasks/presentation/cubit/my_tasks_state.dart';
import 'package:todo_app/features/my_tasks/presentation/widgets/date_selector_bar.dart';
import 'package:todo_app/features/my_tasks/presentation/widgets/my_task_list_view_section.dart';
import 'package:todo_app/features/my_tasks/presentation/widgets/no_tasks_widget.dart';

class MyTasksViewBody extends StatefulWidget {
  const MyTasksViewBody({super.key});

  @override
  State<MyTasksViewBody> createState() => _MyTasksViewBodyState();
}

class _MyTasksViewBodyState extends State<MyTasksViewBody> {
  List<TaskDataModel> myTasks = [];

  @override
  Widget build(BuildContext context) {
    return BlocListener<MyTasksCubit, MyTasksState>(
      listener: (context, state) {
        if (state is UpdateTaskSuccess) {
          showSnackBar(context, AppStrings.taskUpdatedSuccessfully);
        } else if (state is DeleteTaskSuccess) {
          showSnackBar(context, AppStrings.taskDeletedSuccessfully);
        } else if (state is EditTaskSuccess) {
          // Ensure tasks are fetched again to reflect changes after editing
          BlocProvider.of<MyTasksCubit>(context).getTasksByDate();
        }
      },
      child: SingleChildScrollView(
        child: Column(
          children: [
            10.vGap,
            const DateSelectorBar(),
            20.vGap,
            BlocBuilder<MyTasksCubit, MyTasksState>(
              builder: (context, state) {
                if (state is MyTasksLoading) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (state is GetTasksByDateSuccess) {
                  myTasks = state.tasks;
                  if (myTasks.isEmpty) {
                    return const NoTasksWidget(
                      title: AppStrings.noTasksInThisDate,
                      subTitle: '',
                    );
                  }
                  return MyTaskListViewSection(myTasks: myTasks);
                }
                return const SizedBox();
              },
            ),
          ],
        ),
      ),
    );
  }
}

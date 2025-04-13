import 'package:flutter/material.dart';
import 'package:todo_app/core/shared_widgets/custom_app_bar.dart';
import 'package:todo_app/features/add_task/data/models/task_data_model.dart';
import 'package:todo_app/features/my_tasks/presentation/widgets/task_details_widgets/task_details_view_body.dart';

class TaskDetailsView extends StatelessWidget {
  const TaskDetailsView({super.key, required this.taskData});
  final TaskDataModel taskData;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Task Details',
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      body: SafeArea(
        child: TaskDetailsViewBody(
          taskData: taskData,
        ),
      ),
    );
  }
}

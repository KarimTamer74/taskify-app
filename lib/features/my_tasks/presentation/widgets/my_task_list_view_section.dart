import 'package:flutter/material.dart';
import 'package:todo_app/core/extensions/sizedbox_extensions.dart';
import 'package:todo_app/core/routing/routes.dart';
import 'package:todo_app/features/add_task/data/models/task_data_model.dart';
import 'package:todo_app/features/my_tasks/presentation/widgets/my_task_card.dart';

class MyTaskListViewSection extends StatelessWidget {
  const MyTaskListViewSection({super.key, required this.myTasks});
  final List<TaskDataModel> myTasks;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: myTasks.length,
      separatorBuilder: (context, index) => 10.vGap,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            Navigator.pushNamed(context, Routes.taskDetailView,
                arguments: myTasks[index]);
          },
          child: TaskCard(
            taskModel: myTasks[index],
          ),
        );
      },
    );
  }
}

// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/core/extensions/sizedbox_extensions.dart';
import 'package:todo_app/core/routing/routes.dart';
import 'package:todo_app/core/shared_widgets/custom_elevated_button.dart';
import 'package:todo_app/core/shared_widgets/show_bottom_sheet.dart';
import 'package:todo_app/core/shared_widgets/show_snackbar_widget.dart';
import 'package:todo_app/core/theme/app_colors.dart';
import 'package:todo_app/core/utils/app_assets.dart';
import 'package:todo_app/core/utils/app_strings.dart';
import 'package:todo_app/features/add_task/data/models/home_task_model.dart';
import 'package:todo_app/features/add_task/data/models/task_category_model.dart';
import 'package:todo_app/features/add_task/data/models/task_data_model.dart';
import 'package:todo_app/features/add_task/domain/entities/task_field.dart';
import 'package:todo_app/features/add_task/presentation/cubit/add_task_cubit.dart';
import 'package:todo_app/features/add_task/presentation/cubit/add_task_state.dart';
import 'package:todo_app/features/add_task/presentation/widgets/add_task_fields_time.dart';
import 'package:todo_app/features/add_task/presentation/widgets/add_task_fields_top.dart';
import 'package:todo_app/features/add_task/presentation/widgets/add_task_reminder_and_repeat.dart';
import 'package:todo_app/features/add_task/presentation/widgets/categories_selection.dart';
import 'package:todo_app/features/add_task/presentation/widgets/select_card_color.dart';

class AddTaskViewBody extends StatefulWidget {
  const AddTaskViewBody({super.key});

  @override
  State<AddTaskViewBody> createState() => _AddTaskViewBodyState();
}

class _AddTaskViewBodyState extends State<AddTaskViewBody> {
  final _formKey = GlobalKey<FormState>();

  // Controllers for different sections
  final Map<TaskField, TextEditingController> _taskTopControllers = {
    TaskField.title: TextEditingController(),
    TaskField.description: TextEditingController(),
  };

  final Map<TaskField, TextEditingController> _taskTimeControllers = {
    TaskField.date: TextEditingController(),
    TaskField.startTime: TextEditingController(),
    TaskField.endTime: TextEditingController(),
  };

  final Map<TaskField, TextEditingController> _taskBottomControllers = {
    TaskField.reminder: TextEditingController(),
    TaskField.repeat: TextEditingController(),
  };

  @override
  void dispose() {
    // Dispose all controllers when the widget is disposed
    _taskTopControllers.values.forEach((controller) => controller.dispose());
    _taskTimeControllers.values.forEach((controller) => controller.dispose());
    _taskBottomControllers.values.forEach((controller) => controller.dispose());
    super.dispose();
  }

  TaskCategoryModel selectedCategory = TaskCategoryModel(
      categoryName: AppStrings.work,
      iconPath: AppIcons.workIcon,
      categoryColor: AppColors.workColor.toARGB32());
  int selectedCardColor = AppColors.greyShade900.toARGB32();
  @override
  Widget build(BuildContext context) {
    return BlocListener<AddTaskCubit, AddTaskState>(
      listener: (context, state) {
        if (state is AddTaskSuccess) {
          showBottomSheet();
        } else if (state is AddTaskFailure) {
          showSnackBar(
            context,
            "Task creation failed: ${state.error}",
          );
        }
      },
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              AddTaskFieldsTop(controllers: _taskTopControllers),
              AddTaskFieldsTime(controllers: _taskTimeControllers),
              10.vGap,
              AddTaskFieldsBottom(controllers: _taskBottomControllers),
              10.vGap,
              CategoriesSelectionDialog(
                onCategoryTapped: (category) {
                  setState(() {
                    selectedCategory = category;
                  });
                },
              ),
              20.vGap,
              AddTaskSelectColorSection(
                onColorSelected: (color) {
                  setState(() {
                    selectedCardColor = color.toARGB32();
                  });
                },
              ),
              20.vGap,
              CustomElevatedButton(
                text: AppStrings.createTask,
                onPressed: () {
                  _submitTask();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _submitTask() {
    if (_formKey.currentState!.validate()) {
      TaskDataModel task = assignTaskModelData();
      BlocProvider.of<AddTaskCubit>(context).addTask(
        task: task,
      );
    }
  }

  TaskDataModel assignTaskModelData() {
    final task = TaskDataModel(
      homeTaskDataModel: HomeTaskDataModel(
          title: _taskTopControllers[TaskField.title]!.text,
          date: _taskTimeControllers[TaskField.date]!
              .text, // Ensure a valid date is chosen
          time: _taskTimeControllers[TaskField.startTime]!.text,
          isCompleted: 0,
          cardColor: selectedCardColor,
          categoryDetails: selectedCategory),
      description: _taskTopControllers[TaskField.description]!.text,
      startTime: _taskTimeControllers[TaskField.startTime]!.text,
      endTime: _taskTimeControllers[TaskField.endTime]!.text,
      reminder: _taskBottomControllers[TaskField.reminder]!.text,
      repeat: _taskBottomControllers[TaskField.repeat]!.text,
    );
    return task;
  }

  void showBottomSheet() {
    showSuccessBottomSheet(
      context,
      title: 'Your task has been created successfully!',
      message: '',
      textButton: '',
      onFirstButtonPressed: () {
        Navigator.pushNamedAndRemoveUntil(
            context, Routes.myTasksView, (route) => false);
      },
      onSecondButtonPressed: () {
        Navigator.pushReplacementNamed(context, Routes.addTaskView);
      },
    );
    Future.delayed(Duration(seconds: 5), () {
      Navigator.pushNamedAndRemoveUntil(
          context, Routes.myTasksView, (route) => false);
    });
  }
}

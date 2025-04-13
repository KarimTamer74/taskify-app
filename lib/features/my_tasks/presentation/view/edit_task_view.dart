import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/core/extensions/sizedbox_extensions.dart';
import 'package:todo_app/core/shared_widgets/custom_app_bar.dart';
import 'package:todo_app/core/shared_widgets/custom_elevated_button.dart';
import 'package:todo_app/core/shared_widgets/show_snackbar_widget.dart';
import 'package:todo_app/core/utils/app_static_lists.dart';
import 'package:todo_app/core/utils/app_styles.dart';
import 'package:todo_app/features/add_task/data/models/home_task_model.dart';
import 'package:todo_app/features/add_task/data/models/task_data_model.dart';
import 'package:todo_app/features/add_task/presentation/widgets/accept_task_data.dart';
import 'package:todo_app/features/my_tasks/presentation/cubit/my_tasks_cubit.dart';
import 'package:todo_app/features/my_tasks/presentation/cubit/my_tasks_state.dart';
import 'package:todo_app/features/my_tasks/presentation/widgets/custom_titled_list_tile.dart';

class EditTaskView extends StatefulWidget {
  final TaskDataModel taskModel;

  const EditTaskView({super.key, required this.taskModel});

  @override
  State<EditTaskView> createState() => _EditTaskViewState();
}

class _EditTaskViewState extends State<EditTaskView> {
  late TextEditingController titleController;
  late TextEditingController descriptionController;

  late String selectedDate;
  late String selectedStartTime;
  late String selectedEndTime;
  late String selectedReminder;
  late String selectedRepeat;

  @override
  void initState() {
    super.initState();
    final task = widget.taskModel.homeTaskDataModel;
    titleController = TextEditingController(text: task.title);
    descriptionController =
        TextEditingController(text: widget.taskModel.description);
    selectedDate = task.date;
    selectedStartTime = widget.taskModel.startTime;
    selectedEndTime = widget.taskModel.endTime;
    selectedReminder = widget.taskModel.reminder;
    selectedRepeat = widget.taskModel.repeat;
  }

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  Future<void> _pickTime({required bool isStart}) async {
    final pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickedTime != null) {
      final formattedTime = pickedTime.format(context);
      setState(() {
        if (isStart) {
          selectedStartTime = formattedTime;
        } else {
          selectedEndTime = formattedTime;
        }
      });
    }
  }

  Future<void> _pickDate() async {
    final pickedDate = await showDatePicker(
      context: context,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      initialDate: DateTime.now(),
    );

    if (pickedDate != null) {
      setState(() {
        selectedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
      });
    }
  }

  Future<void> _saveChanges() async {
    final updatedTask = TaskDataModel(
      homeTaskDataModel: HomeTaskDataModel(
        title: titleController.text,
        date: selectedDate,
        isCompleted: widget.taskModel.homeTaskDataModel.isCompleted,
        time: '${selectedStartTime} - ${selectedEndTime}',
        cardColor: widget.taskModel.homeTaskDataModel.cardColor,
        categoryDetails: widget.taskModel.homeTaskDataModel.categoryDetails,
        id: widget.taskModel.homeTaskDataModel.id,
      ),
      description: descriptionController.text,
      startTime: selectedStartTime,
      endTime: selectedEndTime,
      reminder: selectedReminder,
      repeat: selectedRepeat,
    );
    BlocProvider.of<MyTasksCubit>(context).editTask(updatedTask);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Edit Task',
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
        actions: IconButton(
          icon: const Icon(Icons.save),
          onPressed: () async {
            await _saveChanges();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: BlocListener<MyTasksCubit, MyTasksState>(
          listener: (context, state) {
            if (state is EditTaskSuccess) {
              Navigator.pop(context, true);
              showSnackBar(context, 'Task Edited successfully!');
            }
            if (state is MyTasksFailure) {
              showSnackBar(context, state.error);
            }
            if (state is MyTasksLoading) {
              showSnackBar(context, 'Loading...');
            }
          },
          child: ListView(
            children: [
              AcceptTaskData(
                  textFieldTitle: 'Title',
                  hintText: 'Title',
                  controller: titleController),
              10.vGap,
              AcceptTaskData(
                textFieldTitle: 'Description',
                hintText: 'Description',
                controller: descriptionController,
                maxLines: 3,
              ),
              10.vGap,
              CustomTitledListTile(
                headerTitle: 'Date',
                listTileTitle: selectedDate,
                iconData: Icons.calendar_today,
                onpressed: _pickDate,
              ),
              10.vGap,
              CustomTitledListTile(
                headerTitle: 'Start Time',
                listTileTitle: selectedStartTime,
                iconData: Icons.access_time,
                onpressed: () => _pickTime(isStart: true),
              ),
              10.vGap,
              CustomTitledListTile(
                headerTitle: 'End Time',
                listTileTitle: selectedEndTime,
                iconData: Icons.access_time,
                onpressed: () => _pickTime(isStart: false),
              ),
              10.vGap,
              Text(
                'Reminder',
                style: AppStyles.textStyleBold18,
              ),
              8.vGap,
              DropdownButtonFormField<String>(
                value: AppStaticLists.reminderOptions.contains(selectedReminder)
                    ? selectedReminder
                    : null,
                items: AppStaticLists.reminderOptions
                    .map((reminder) => DropdownMenuItem(
                        value: reminder, child: Text(reminder)))
                    .toList(),
                onChanged: (value) => setState(() => selectedReminder = value!),
                decoration: const InputDecoration(labelText: 'Reminder'),
              ),
              10.vGap,
              Text(
                'Repeat',
                style: AppStyles.textStyleBold18,
              ),
              8.vGap,
              DropdownButtonFormField<String>(
                value: AppStaticLists.repeatOptions.contains(selectedRepeat)
                    ? selectedRepeat
                    : null,
                items: AppStaticLists.repeatOptions
                    .map((repeat) =>
                        DropdownMenuItem(value: repeat, child: Text(repeat)))
                    .toList(),
                onChanged: (value) => setState(() => selectedRepeat = value!),
                decoration: const InputDecoration(labelText: 'Repeat'),
              ),
              20.vGap,
              CustomElevatedButton(
                  text: 'Save',
                  onPressed: () async {
                    await _saveChanges();
                  }),
            ],
          ),
        ),
      ),
    );
  }
}

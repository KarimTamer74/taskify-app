import 'package:todo_app/features/add_task/data/models/home_task_model.dart';
import 'package:todo_app/features/add_task/data/models/task_category_model.dart';

class TaskDataModel {
  final String description;
  final String startTime;
  final String endTime;
  final String reminder;
  final String repeat;
  final HomeTaskDataModel homeTaskDataModel;

  const TaskDataModel({
    required this.homeTaskDataModel,
    required this.description,
    required this.startTime,
    required this.endTime,
    required this.reminder,
    required this.repeat,
  });
  Map<String, dynamic> toMap() {
    return {
      'id': homeTaskDataModel.id,
      'title': homeTaskDataModel.title,
      'description': description,
      'date': homeTaskDataModel.date,
      'startTime': startTime,
      'endTime': endTime,
      'reminder': reminder,
      'repeat': repeat,
      'cardColor': homeTaskDataModel.cardColor,
      'isCompleted': homeTaskDataModel.isCompleted,
      'categoryName': homeTaskDataModel.categoryDetails.categoryName,
      'iconPath': homeTaskDataModel.categoryDetails.iconPath,
      'categoryColor': homeTaskDataModel.categoryDetails.categoryColor,
    };
  }

  factory TaskDataModel.fromMap(Map<String, dynamic> map) {
    return TaskDataModel(
      description: map['description'],
      startTime: map['startTime'],
      endTime: map['endTime'],
      reminder: map['reminder'],
      repeat: map['repeat'],
      homeTaskDataModel: HomeTaskDataModel(
        id: map['id'],
        title: map['title'],
        date: map['date'],
        time: map['startTime'],
        isCompleted: map['isCompleted'],
        cardColor: map['cardColor'],
        categoryDetails: TaskCategoryModel(
          categoryName: map['categoryName'],
          iconPath: map['iconPath'],
          categoryColor: map['categoryColor'],
        ),
      ),
    );
  }
}

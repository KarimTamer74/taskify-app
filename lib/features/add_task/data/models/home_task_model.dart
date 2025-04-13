
import 'package:todo_app/features/add_task/data/models/task_category_model.dart';

class HomeTaskDataModel {
   int? id;
  final int? cardColor;
  final String time;
  final String title;
  final int isCompleted;
  final String date;
  final TaskCategoryModel categoryDetails;

   HomeTaskDataModel({
    this.id,
    required this.title,
    required this.isCompleted,
    required this.date,
    required this.time,
    required this.cardColor,
    required this.categoryDetails,
  });
}


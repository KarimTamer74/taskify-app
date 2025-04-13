import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/core/extensions/sizedbox_extensions.dart';
import 'package:todo_app/core/routing/routes.dart';
import 'package:todo_app/core/shared_widgets/custom_elevated_button.dart';
import 'package:todo_app/core/utils/app_strings.dart';
import 'package:todo_app/core/utils/app_styles.dart';

class DataSelectorHeadSection extends StatelessWidget {
  const DataSelectorHeadSection({
    super.key,
    required this.selectedDate,
  });

  final DateTime selectedDate;
  String _getDayLabel(DateTime date) {
    final now = DateTime.now();
    final isToday =
        now.year == date.year && now.month == date.month && now.day == date.day;

    if (isToday) {
      return '• ${AppStrings.today.tr()}';
    } else {
      return '• ${DateFormat('EEEE').format(date)}';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              DateFormat('MMMM d, y').format(selectedDate),
              style: AppStyles.greyTextStyle20,
            ),
            8.vGap,
            Text(
              _getDayLabel(selectedDate),
              style: AppStyles.textStyleBold20,
            ),
          ],
        ),
        CustomElevatedButton(
          text: AppStrings.addTask,
          onPressed: () {
            Navigator.pushNamed(context, Routes.addTaskView);
          },
        )
      ],
    );
  }
}

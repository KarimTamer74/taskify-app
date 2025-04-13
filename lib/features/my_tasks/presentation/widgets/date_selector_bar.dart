import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/core/extensions/sizedbox_extensions.dart';
import 'package:todo_app/features/my_tasks/presentation/cubit/my_tasks_cubit.dart';
import 'package:todo_app/features/my_tasks/presentation/widgets/date_selection_item.dart';
import 'package:todo_app/features/my_tasks/presentation/widgets/date_selector_head_section.dart';

class DateSelectorBar extends StatefulWidget {
  const DateSelectorBar({super.key});

  @override
  State<DateSelectorBar> createState() => _DateSelectorBarState();
}

class _DateSelectorBarState extends State<DateSelectorBar> {
  int selectedIndex = 2;
  DateTime selectedDate = DateTime.now();
  final int daysCount = 7;

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DataSelectorHeadSection(selectedDate: selectedDate),
        16.vGap,
        SizedBox(
          height: 90.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: daysCount,
            padding: EdgeInsets.symmetric(horizontal: 8),
            itemBuilder: (context, index) {
              DateTime date = now.subtract(Duration(days: 2 - index));
              String day = DateFormat('E').format(date).toUpperCase(); // MON
              String month =
                  DateFormat('MMM').format(date).toUpperCase(); // APR
              String dayNumber = DateFormat('d').format(date); // 10
              bool isSelected = index == selectedIndex;

              return GestureDetector(
                onTap: () {
                  if (selectedIndex == index) return;

                  setState(() {
                    selectedIndex = index;
                    selectedDate = date;
                  });

                  final formattedDate =
                      DateFormat('yyyy-MM-dd').format(selectedDate);
                  BlocProvider.of<MyTasksCubit>(context)
                      .acceptSelectedDate(date: formattedDate);
                  BlocProvider.of<MyTasksCubit>(context).getTasksByDate();
                },
                child: DateSelectionItem(
                    isSelected: isSelected,
                    month: month,
                    dayNumber: dayNumber,
                    day: day),
              );
            },
          ),
        ),
      ],
    );
  }
}

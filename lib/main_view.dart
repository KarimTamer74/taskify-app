import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:todo_app/core/theme/app_colors.dart';
import 'package:todo_app/features/add_task/presentation/view/add_task_view.dart';
import 'package:todo_app/features/home/presentation/view/home_view.dart';
import 'package:todo_app/features/my_tasks/presentation/view/my_task_view.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  final PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PersistentTabView(
        controller: _controller,
        backgroundColor: AppColors.black,
        popAllScreensOnTapOfSelectedTab: true,
        popActionScreens: PopActionScreensType.all,
        screenTransitionAnimation: ScreenTransitionAnimation(
          curve: Curves.easeInOut,
          duration: Duration(milliseconds: 200),
        ),
        tabs: [
          PersistentTabConfig(
            screen: HomeView(),
            item: ItemConfig(
              inactiveIcon: Icon(Icons.home_outlined,
                  size: 26.sp, color: AppColors.white),
              icon: Icon(Icons.home_filled,
                  size: 26.sp, color: AppColors.primaryBlueClr),
              title: "Home",
              activeForegroundColor: AppColors.primaryBlueClr,
              inactiveForegroundColor: AppColors.white,
            ),
          ),
          PersistentTabConfig(
            screen: MyTasksView(),
            item: ItemConfig(
              inactiveIcon:
                  Icon(Icons.checklist, size: 26.sp, color: AppColors.white),
              icon: Icon(Icons.checklist,
                  size: 22.sp, color: AppColors.primaryBlueClr),
              title: "Tasks",
              activeForegroundColor: AppColors.primaryBlueClr,
              inactiveForegroundColor: AppColors.white,
            ),
          ),
          PersistentTabConfig(
            screen: AddTaskView(),
            item: ItemConfig(
              inactiveIcon:
                  Icon(Icons.add_outlined, size: 26.sp, color: AppColors.white),
              icon: Icon(Icons.add_circle,
                  size: 26.sp, color: AppColors.primaryBlueClr),
              title: "Add",
              activeForegroundColor: AppColors.primaryBlueClr,
              inactiveForegroundColor: AppColors.white,
            ),
          ),
          PersistentTabConfig(
            screen: AddTaskView(),
            item: ItemConfig(
              inactiveIcon: Icon(Icons.access_time_outlined,
                  size: 26.sp, color: AppColors.white),
              icon: Icon(Icons.access_time,
                  size: 26.sp, color: AppColors.primaryBlueClr),
              title: "Focus",
              activeForegroundColor: AppColors.primaryBlueClr,
              inactiveForegroundColor: AppColors.white,
            ),
          ),
          PersistentTabConfig(
            screen: AddTaskView(),
            item: ItemConfig(
              inactiveIcon: Icon(Icons.settings_outlined,
                  size: 26.sp, color: AppColors.white),
              icon: Icon(Icons.settings,
                  size: 26.sp, color: AppColors.primaryBlueClr),
              title: "Settings",
              activeForegroundColor: AppColors.primaryBlueClr,
              inactiveForegroundColor: AppColors.white,
            ),
          ),
        ],
        navBarBuilder: (navBarConfig) => Style6BottomNavBar(
          navBarConfig: navBarConfig,
          navBarDecoration: NavBarDecoration(
            color: AppColors.black,
            borderRadius: BorderRadius.circular(25.r),
            border: Border(
              top: BorderSide(color: AppColors.primaryBlueClr, width: .8),
            ),
          ),
        ),
      ),
    );
  }
}

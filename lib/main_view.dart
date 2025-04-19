import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:todo_app/core/extensions/app_theme_ext.dart';
import 'package:todo_app/core/theme/app_colors.dart';
import 'package:todo_app/features/add_task/presentation/view/add_task_view.dart';
import 'package:todo_app/features/focus_mode/presentation/views/focus_mode_view.dart';
import 'package:todo_app/features/home/presentation/view/home_view.dart';
import 'package:todo_app/features/my_tasks/presentation/view/my_task_view.dart';
import 'package:todo_app/features/settings/presentation/views/settings_view.dart';

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
    final isDark = context.isDarkMode;
    return Scaffold(
        body: PersistentTabView(
      controller: _controller,
      backgroundColor: isDark ? AppColors.black : AppColors.white,
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      screenTransitionAnimation: ScreenTransitionAnimation(
        curve: Curves.easeInOut,
        duration: Duration(milliseconds: 200),
      ),
      tabs: tabs(isDark: isDark),
      navBarBuilder: (navBarConfig) => Style6BottomNavBar(
        navBarConfig: navBarConfig,
        navBarDecoration: NavBarDecoration(
          color: isDark ? AppColors.black : AppColors.white,
          borderRadius: BorderRadius.circular(25.r),
          border: Border(
            top: BorderSide(color: AppColors.primaryBlueClr, width: .8),
          ),
        ),
      ),
    ));
  }

  List<PersistentTabConfig> tabs({required bool isDark}) {
    return [
      PersistentTabConfig(
        screen: HomeView(),
        item: ItemConfig(
          inactiveIcon: Icon(Icons.home_outlined,
              size: 26.sp, color: isDark ? AppColors.white : Colors.black),
          icon: Icon(Icons.home_filled,
              size: 26.sp, color: AppColors.primaryBlueClr),
          title: "Home",
          activeForegroundColor: AppColors.primaryBlueClr,
          inactiveForegroundColor: isDark ? AppColors.white : Colors.black,
        ),
      ),
      PersistentTabConfig(
        screen: MyTasksView(),
        item: ItemConfig(
          inactiveIcon: Icon(Icons.checklist,
              size: 26.sp, color: isDark ? AppColors.white : Colors.black),
          icon: Icon(Icons.checklist,
              size: 22.sp, color: AppColors.primaryBlueClr),
          title: "Tasks",
          activeForegroundColor: AppColors.primaryBlueClr,
          inactiveForegroundColor: isDark ? AppColors.white : Colors.black,
        ),
      ),
      PersistentTabConfig(
        screen: AddTaskView(),
        item: ItemConfig(
          inactiveIcon: Icon(Icons.add_outlined,
              size: 26.sp, color: isDark ? AppColors.white : Colors.black),
          icon: Icon(Icons.add_circle,
              size: 26.sp, color: AppColors.primaryBlueClr),
          title: "Add",
          activeForegroundColor: AppColors.primaryBlueClr,
          inactiveForegroundColor: isDark ? AppColors.white : Colors.black,
        ),
      ),
      PersistentTabConfig(
        screen: FocusModeView(),
        item: ItemConfig(
          inactiveIcon: Icon(Icons.access_time_outlined,
              size: 26.sp, color: isDark ? AppColors.white : Colors.black),
          icon: Icon(Icons.access_time,
              size: 26.sp, color: AppColors.primaryBlueClr),
          title: "Focus",
          activeForegroundColor: AppColors.primaryBlueClr,
          inactiveForegroundColor: isDark ? AppColors.white : Colors.black,
        ),
      ),
      PersistentTabConfig(
        screen: SettingsView(),
        item: ItemConfig(
          inactiveIcon: Icon(Icons.settings,
              size: 26.sp, color: isDark ? AppColors.white : Colors.black),
          icon: Icon(Icons.settings,
              size: 26.sp, color: AppColors.primaryBlueClr),
          title: "Settings",
          activeForegroundColor: AppColors.primaryBlueClr,
          inactiveForegroundColor: isDark ? AppColors.white : Colors.black,
        ),
      ),
    ];
  }
}

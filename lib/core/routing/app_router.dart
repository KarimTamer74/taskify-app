import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/features/add_task/data/models/task_data_model.dart';
import 'package:todo_app/features/add_task/presentation/view/add_task_view.dart';
import 'package:todo_app/features/home/presentation/view/home_view.dart';
import 'package:todo_app/features/my_tasks/presentation/cubit/my_tasks_cubit.dart';
import 'package:todo_app/features/my_tasks/presentation/view/edit_task_view.dart';
import 'package:todo_app/features/my_tasks/presentation/view/my_task_view.dart';
import 'package:todo_app/features/my_tasks/presentation/view/task_details_view.dart';
import 'package:todo_app/main_view.dart';

import '../../features/onboarding/presentation/view/onboarding_view.dart';
import '../../features/splash/presentation/screens/splash_screen.dart';
import '../routing/routes.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.signupView:
        return _createRoute(const SplashScreen());
      case Routes.onBoardingView:
        return _createRoute(const OnboardingView());
      case Routes.mainView:
        return _createRoute(const MainView());
      case Routes.homeView:
        return _createRoute(const HomeView());
      case Routes.myTasksView:
        return _createRoute(const MyTasksView());
      case Routes.editTaskView:
        final taskData = settings.arguments as TaskDataModel;
        return _createRoute(BlocProvider(
          create: (context) => MyTasksCubit(),
          child: EditTaskView(
            taskModel: taskData,
          ),
        ));
      case Routes.addTaskView:
        return _createRoute(const AddTaskView());
      case Routes.taskDetailView:
        final taskData = settings.arguments as TaskDataModel;
        return _createRoute(TaskDetailsView(
          taskData: taskData,
        ));
      default:
        return null;
    }
  }

  PageRouteBuilder _createRoute(Widget page) {
    return PageRouteBuilder(
      transitionDuration: const Duration(milliseconds: 400),
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
    );
  }
}

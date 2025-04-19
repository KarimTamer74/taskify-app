import 'package:flutter/material.dart';
import 'package:todo_app/features/onboarding/presentation/view/onboarding_view.dart';
import 'package:todo_app/functions.dart';
import 'package:todo_app/main_view.dart';

class InitScreen extends StatelessWidget {
  const InitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
        future: checkOnboardingStatus(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.data == null || snapshot.data == true) {
            return const MainView();
          }
          return const OnboardingView();
        });
  }
}

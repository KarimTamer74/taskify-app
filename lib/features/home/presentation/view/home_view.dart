import 'package:flutter/material.dart';
import 'package:todo_app/core/shared_widgets/custom_app_bar.dart';
import 'package:todo_app/features/home/presentation/view/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: CustomAppBar(),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: HomeViewBody(),
      )),
    );
  }
}

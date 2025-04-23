import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/core/shared_widgets/custom_app_bar.dart';
import 'package:todo_app/core/utils/app_strings.dart';
import 'package:todo_app/features/focus_mode/presentation/widgets/focus_mode_view_body.dart';

import '../cubit/focus_mode_cubit.dart';

class FocusModeView extends StatelessWidget {
  const FocusModeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => Focus_modeCubit(),
      child: Scaffold(
        appBar: CustomAppBar(title: AppStrings.focusMode),
        body: SafeArea(
          child: const FocusModeViewBody(),
        ),
      ),
    );
  }
}

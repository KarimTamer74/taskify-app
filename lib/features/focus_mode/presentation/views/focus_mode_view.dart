import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/focus_mode_cubit.dart';
import '../cubit/focus_mode_state.dart';

class FocusModeView extends StatelessWidget {
  const FocusModeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => Focus_modeCubit(),
      child: Scaffold(
        appBar: AppBar(title: const Text('Focus_mode Page')),
        body: BlocBuilder<Focus_modeCubit, Focus_modeState>(
          builder: (context, state) {
            if (state is Focus_modeLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is Focus_modeFailure) {
              return Center(child: Text('Error: ${state.error}'));
            }
            return const Center(child: Text('Focus_mode Page'));
          },
        ),
      ),
    );
  }
}

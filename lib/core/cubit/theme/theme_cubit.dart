import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../utils/app_shared_preferences.dart';
import '../../constants/app_constants.dart';


part 'theme_state.dart';


class ThemeCubit extends Cubit<ThemeState> {
 ThemeCubit() : super(ThemeState(_getInitialTheme()));


 static ThemeMode _getInitialTheme() {
   final savedTheme = AppPreferences().getData(AppConstants.themeKey);
   if (savedTheme == 'dark') return ThemeMode.dark;
   if (savedTheme == 'light') return ThemeMode.light;
   return ThemeMode.system;
 }


 Future<void> changeTheme(ThemeMode newTheme) async {
   await AppPreferences().setData(AppConstants.themeKey, newTheme.name);
   emit(ThemeState(newTheme));
 }
}



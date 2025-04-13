import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../utils/app_shared_preferences.dart';
import '../../constants/app_constants.dart';


part 'locale_state.dart';


class LocaleCubit extends Cubit<LocaleState> {
 LocaleCubit() : super(LocaleState(_getInitialLocale()));


 static Locale _getInitialLocale() {
   final savedLocale = AppPreferences().getData(AppConstants.localeKey);
   return savedLocale == 'ar' ? const Locale('ar') : const Locale('en');
 }


 Future<void> changeLocale(Locale newLocale) async {
   await AppPreferences().setData(AppConstants.localeKey, newLocale.languageCode);
   emit(LocaleState(newLocale));
 }
}



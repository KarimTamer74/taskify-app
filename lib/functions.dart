
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/core/constants/app_constants.dart';

Future<SharedPreferences> init() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs;
}

Future<void> completeOnboardingView() async {
 final prefs = await init();
  await prefs.setBool(AppConstants.isOnboardingDone, true);
}

Future<bool> checkOnboardingStatus() async {
 final prefs = await init();

  return prefs.getBool(AppConstants.isOnboardingDone) ?? false;
}
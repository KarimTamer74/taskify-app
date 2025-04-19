import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:local_auth/local_auth.dart';
import 'package:todo_app/init_screen.dart';
import 'package:todo_app/main_view.dart';

import 'core/constants/app_constants.dart';
import 'core/cubit/theme/theme_cubit.dart';
import 'core/routing/app_router.dart';
import 'core/theme/app_theme.dart';

class UpTodo extends StatelessWidget {
  final AppRouter appRouter;
  const UpTodo({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, themeState) => ScreenUtilInit(
              designSize: const Size(375, 812),
              minTextAdapt: true,
              splitScreenMode: true,
              builder: (context, child) {
                return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  title: AppConstants.appName,
                  theme: AppTheme.lightTheme,
                  darkTheme: AppTheme.darkTheme,
                  themeMode: ThemeMode.dark,
                  locale: context.locale,
                  supportedLocales: context.supportedLocales,
                  localizationsDelegates: context.localizationDelegates,
                  onGenerateRoute: appRouter.generateRoute,
                  initialRoute: '/',
                  home: InitScreen(),
                );
              },
            ));
  }
}

class SplashAuthScreen extends StatefulWidget {
  @override
  _SplashAuthScreenState createState() => _SplashAuthScreenState();
}

class _SplashAuthScreenState extends State<SplashAuthScreen> {
  final LocalAuthentication auth = LocalAuthentication();

  @override
  void initState() {
    super.initState();
    _checkBiometric();
  }

  Future<void> _checkBiometric() async {
    try {
      bool canAuthenticate =
          await auth.canCheckBiometrics || await auth.isDeviceSupported();
      if (!canAuthenticate) {
        _showError("جهازك لا يدعم البصمة");
        return;
      }

      bool isAuthenticated = await auth.authenticate(
        localizedReason: 'الرجاء تأكيد هويتك بالبصمة',
        options: const AuthenticationOptions(
          biometricOnly: true,
          stickyAuth: true,
        ),
      );

      if (isAuthenticated) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => MainView()),
        );
      } else {
        _showError("فشل التحقق من البصمة");
      }
    } catch (e) {
      _showError("حدث خطأ أثناء المصادقة: $e");
    }
  }

  void _showError(String msg) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text("خطأ"),
        content: Text(msg),
        actions: [
          TextButton(
            child: Text("خروج"),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: CircularProgressIndicator()), // شاشة تحميل مؤقتة
    );
  }
}

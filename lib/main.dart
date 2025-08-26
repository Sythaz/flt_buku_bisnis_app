import 'package:flutter/material.dart';
import 'core/constants/app_strings.dart';
import 'core/themes/app_themes.dart';
import 'core/navigation/navigation_service.dart';
import 'presentation/pages/auth/login_page.dart';

void main() {
  runApp(const BookkeepingApp());
}

class BookkeepingApp extends StatelessWidget {
  const BookkeepingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.appName,
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      navigatorKey: NavigationService.navigatorKey,
      home: const LoginPage(),
    );
  }
}

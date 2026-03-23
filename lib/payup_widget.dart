import 'package:flutter/material.dart';
import 'package:payup/core/themes/app_theme.dart';
import 'package:payup/screens/splash/splash_screen.dart';

class PayupWidget extends StatelessWidget {
  const PayupWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: SplashScreen(),
    );
  }
}

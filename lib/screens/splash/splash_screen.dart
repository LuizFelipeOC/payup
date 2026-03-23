import 'package:flutter/material.dart';
import 'package:payup/core/shared/images/app_icons.dart';
import 'package:payup/core/shared/widgets/svg/app_svg.dart';
import 'package:payup/screens/login/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    mockLoginNavigation();
    super.initState();
  }

  Future<void> mockLoginNavigation() async {
    await Future.delayed(const Duration(seconds: 3));
    if (mounted) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.sizeOf(context);

    return Scaffold(
      body: Stack(
        children: [
          AppSvg(
            asset: AppIcons.vector,
            fit: BoxFit.cover,
            width: mediaQuery.width,
            height: mediaQuery.height,
          ),
          Center(
            child: AppSvg(asset: AppIcons.logo, width: mediaQuery.width * 0.28),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:payup/core/shared/images/app_icons.dart';
import 'package:payup/core/shared/widgets/svg/app_svg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
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

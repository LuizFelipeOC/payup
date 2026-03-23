import 'package:flutter/material.dart';

class AppGradient {
  static const LinearGradient gradientGreenBlue = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF7E52FF), Color(0xFF00FAA3), Color(0xFF57F2BE)],
    stops: [0.0, 0.5, 1.0],
  );

  static const LinearGradient gradientBluePurple = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF7E52FF), Color(0xFF2A8DFF)],
    stops: [0.0, 1.0],
  );
}

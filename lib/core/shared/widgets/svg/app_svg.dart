import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppSvg extends StatelessWidget {
  final String asset;
  final double? width;
  final double? height;
  final BoxFit fit;
  final Color? color;
  final String? semanticsLabel;

  const AppSvg({
    super.key,
    required this.asset,
    this.width,
    this.height,
    this.fit = BoxFit.contain,
    this.color,
    this.semanticsLabel,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      asset,
      width: width,
      height: height,
      fit: fit,
      semanticsLabel: semanticsLabel,
      colorFilter: color == null ? null : ColorFilter.mode(color!, BlendMode.srcIn),
    );
  }
}

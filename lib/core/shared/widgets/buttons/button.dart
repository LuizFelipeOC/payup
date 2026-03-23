import 'package:flutter/material.dart';
import 'package:payup/core/themes/app_colors.dart';

enum ButtonVariant { primary, secondary }

class Button extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final ButtonVariant variant;
  final bool enabled;
  final double? width;
  final double? height;
  final EdgeInsets? padding;

  const Button({
    super.key,
    required this.label,
    required this.onPressed,
    this.variant = ButtonVariant.primary,
    this.enabled = true,
    this.width,
    this.height,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height ?? 56,
      child: ElevatedButton(
        onPressed: enabled ? onPressed : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: _getBackgroundColor(),
          disabledBackgroundColor: _getDisabledBackgroundColor(),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          padding: padding ?? const EdgeInsets.symmetric(horizontal: 24),
          elevation: 0,
        ),
        child: Text(
          label,
          style: TextStyle(
            color: _getTextColor(),
            fontSize: 16,
            fontWeight: FontWeight.w600,
            fontFamily: 'K2D',
          ),
        ),
      ),
    );
  }

  Color _getBackgroundColor() {
    if (!enabled) return _getDisabledBackgroundColor();

    return variant == ButtonVariant.primary
        ? AppColors.accentBrand
        : AppColors.backgroundComponents;
  }

  Color _getDisabledBackgroundColor() {
    return variant == ButtonVariant.primary
        ? AppColors.accentBrand
        : AppColors.backgroundComponents;
  }

  Color _getTextColor() {
    return variant == ButtonVariant.primary ? AppColors.textInvert : AppColors.textHeading;
  }
}

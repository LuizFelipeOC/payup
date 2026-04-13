import 'package:flutter/material.dart';
import 'package:payup/core/shared/images/app_icons.dart';
import 'package:payup/core/shared/widgets/svg/app_svg.dart';
import 'package:payup/core/themes/app_colors.dart';

class CardClient extends StatelessWidget {
  final String text;

  const CardClient({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 128,
      child: Card(
        color: AppColors.backgroundSecondary,
        child: Padding(
          padding: .all(12),
          child: Column(
            crossAxisAlignment: .start,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: AppColors.backgroundComponents,
                  borderRadius: .circular(3),
                ),
                child: Padding(
                  padding: .all(6),
                  child: AppSvg(asset: AppIcons.buildings),
                ),
              ),
              SizedBox(height: 8),
              Text(text, style: Theme.of(context).textTheme.labelMedium),
            ],
          ),
        ),
      ),
    );
  }
}

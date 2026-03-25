import 'package:flutter/material.dart';
import 'package:payup/core/extensions/media_query_extension.dart';
import 'package:payup/core/shared/images/app_icons.dart';
import 'package:payup/core/shared/widgets/svg/app_svg.dart';
import 'package:payup/core/themes/app_colors.dart';

class UserAppBar extends StatelessWidget implements PreferredSizeWidget {
  const UserAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = context.width;

    return PreferredSize(
      preferredSize: const Size.fromHeight(56),
      child: Padding(
        padding: .only(top: 80, right: 20, left: 20),
        child: Container(
          color: AppColors.backgroundPrimary,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppSvg(asset: AppIcons.logo, width: mediaQuery * 0.26),
              Row(
                crossAxisAlignment: .center,
                children: [
                  AppSvg(asset: AppIcons.belll, width: 24, height: 24),
                  const SizedBox(width: 12),
                  CustomUserAvatar(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}

class CustomUserAvatar extends StatelessWidget {
  const CustomUserAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white.withValues(alpha: 0.2), shape: BoxShape.circle),
      height: 44,
      width: 44,
      child: Center(
        child: const Text('C', style: TextStyle(color: Colors.white)),
      ),
    );
  }
}

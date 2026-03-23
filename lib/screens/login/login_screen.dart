import 'package:flutter/material.dart';
import 'package:payup/core/shared/images/app_icons.dart';
import 'package:payup/core/shared/widgets/glass_card/glass_card.dart';
import 'package:payup/core/shared/widgets/svg/app_svg.dart';
import 'package:payup/core/themes/app_colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.sizeOf(context);
    final textStyles = Theme.of(context).textTheme;

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
            child: Padding(
              padding: EdgeInsets.only(right: 24, left: 24),
              child: GlassCard(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AppSvg(asset: AppIcons.logo, width: mediaQuery.width * 0.26),
                      const SizedBox(height: 94),
                      Text.rich(
                        TextSpan(
                          text: 'Olá Calisto,\n',
                          style: textStyles.titleLarge,
                          children: [
                            TextSpan(
                              text: 'Desbloqueie com segurança usando o Face ID.',
                              style: textStyles.bodyMedium,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 41),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.2),
                          shape: BoxShape.circle,
                        ),
                        padding: const EdgeInsets.all(16),
                        child: AppSvg(asset: AppIcons.faceId, width: 40),
                      ),
                      const SizedBox(height: 130),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AppSvg(asset: AppIcons.frame, width: 40),
                          const SizedBox(width: 12),
                          Flexible(
                            child: Text.rich(
                              TextSpan(
                                text: 'Não consegue acessar a conta?\n',
                                style: textStyles.headlineSmall?.copyWith(
                                  color: AppColors.textHeading,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                ),
                                children: [
                                  TextSpan(
                                    text: 'Entre em contato',
                                    style: textStyles.labelMedium?.copyWith(
                                      color: AppColors.accentBrandDark,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 23),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

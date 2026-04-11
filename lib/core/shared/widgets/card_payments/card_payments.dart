import 'package:flutter/material.dart';
import 'package:payup/core/shared/images/app_icons.dart';
import 'package:payup/core/shared/widgets/svg/app_svg.dart';
import 'package:payup/core/themes/app_colors.dart';

enum CardPaymentType { empty, received, toReceive }

class CardPayments extends StatelessWidget {
  final CardPaymentType type;
  final String? title;
  final String? value;

  const CardPayments({super.key, required this.type, this.title, this.value});

  @override
  Widget build(BuildContext context) {
    final textStyles = Theme.of(context).textTheme;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildIcon(),
            const SizedBox(width: 8),
            Expanded(child: _buildContent(textStyles)),
          ],
        ),
      ),
    );
  }

  Widget _buildIcon() {
    switch (type) {
      case CardPaymentType.received:
        return AppSvg(asset: AppIcons.coins, width: 24, height: 24, color: AppColors.accentGreen);

      case CardPaymentType.toReceive:
        return AppSvg(
          asset: AppIcons.calendarDollar,
          width: 24,
          height: 24,
          color: AppColors.accentOrange,
        );

      case CardPaymentType.empty:
        return AppSvg(asset: AppIcons.calendar, width: 24, height: 24);
    }
  }

  Widget _buildContent(TextTheme textStyles) {
    switch (type) {
      case CardPaymentType.empty:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Nenhum pagamento agendado para hoje',
              style: textStyles.titleSmall?.copyWith(fontSize: 18),
            ),
            Text(
              'Acompanhe seus próximos recebimentos ou revise seu histórico.',
              style: textStyles.bodyMedium,
            ),
          ],
        );

      case CardPaymentType.received:
      case CardPaymentType.toReceive:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              type == CardPaymentType.received ? 'Recebido' : 'A receber',
              style: textStyles.bodyMedium,
            ),

            if (title != null) Text(title!, style: textStyles.labelMedium?.copyWith(fontSize: 16)),

            if (value != null) ...[
              const SizedBox(height: 4),
              Text(
                value!,
                style: textStyles.titleMedium?.copyWith(fontSize: 16, fontWeight: FontWeight.w900),
              ),
            ],
          ],
        );
    }
  }
}

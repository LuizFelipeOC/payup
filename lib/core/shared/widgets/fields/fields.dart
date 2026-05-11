import 'package:flutter/material.dart';
import 'package:payup/core/themes/app_colors.dart';

class Fields extends StatelessWidget {
  final String label;
  final TextEditingController? controller;
  final String? hintText;
  final String? prefixText;
  final Widget? suffix;
  final List<String>? dropdownItems;
  final String? dropdownValue;
  final ValueChanged<String?>? onDropdownChanged;
  final bool readOnly;
  final VoidCallback? onTap;
  final TextInputType? keyboardType;
  final TextAlign textAlign;

  const Fields({
    super.key,
    this.label = '',
    this.controller,
    this.hintText,
    this.prefixText,
    this.suffix,
    this.dropdownItems,
    this.dropdownValue,
    this.onDropdownChanged,
    this.readOnly = false,
    this.onTap,
    this.keyboardType,
    this.textAlign = TextAlign.start,
  });

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label.isNotEmpty) Text(label, style: textStyle.labelMedium),
        const SizedBox(height: 12),
        TextFormField(
          style: textStyle.bodyMedium,
          controller: controller,
          readOnly: readOnly,
          textAlign: textAlign,
          onTap: onTap,
          cursorHeight: 16,
          cursorColor: AppColors.textPlaceholder,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            hintText: hintText,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          ),
        ),
      ],
    );
  }
}

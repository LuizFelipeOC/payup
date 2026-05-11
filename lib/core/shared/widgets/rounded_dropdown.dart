import 'package:flutter/material.dart';

class RoundedDropdown extends StatelessWidget {
  final List<String> items;
  final String? value;
  final ValueChanged<String?> onSelected;
  final Color backgroundColor;
  final TextStyle? textStyle;
  final double borderRadius;
  final EdgeInsetsGeometry padding;
  final double? maxWidth;
  final EdgeInsetsGeometry itemPadding;
  final double itemBorderRadius;
  final EdgeInsetsGeometry menuPadding;

  const RoundedDropdown({
    super.key,
    required this.items,
    required this.onSelected,
    this.value,
    this.backgroundColor = Colors.white,
    this.textStyle,
    this.borderRadius = 28,
    this.padding = const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    this.maxWidth,
    this.itemPadding = const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    this.itemBorderRadius = 8,
    this.menuPadding = const EdgeInsets.fromLTRB(4, 6, 4, 0),
  });

  Future<void> _openMenu(BuildContext context) async {
    final RenderBox overlay = Overlay.of(context).context.findRenderObject() as RenderBox;
    final RenderBox button = context.findRenderObject() as RenderBox;
    final Offset position = button.localToGlobal(Offset.zero, ancestor: overlay);

    final double left = (position.dx - menuPadding.horizontal / 2).clamp(0.0, overlay.size.width);
    final double top = (position.dy + button.size.height + menuPadding.vertical / 2).clamp(
      0.0,
      overlay.size.height,
    );
    final double right =
        (overlay.size.width - position.dx - button.size.width - menuPadding.horizontal / 2).clamp(
          0.0,
          overlay.size.width,
        );
    final double bottom =
        (overlay.size.height - position.dy - button.size.height - menuPadding.vertical / 2).clamp(
          0.0,
          overlay.size.height,
        );

    final RelativeRect rect = RelativeRect.fromLTRB(left, top, right, bottom);

    final selected = await showMenu<String>(
      context: context,
      position: rect,
      items: items
          .map(
            (e) => PopupMenuItem<String>(
              value: e,
              child: Padding(
                padding: itemPadding,
                child: Text(e, style: textStyle),
              ),
            ),
          )
          .toList(),
      color: backgroundColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(itemBorderRadius)),
    );

    if (selected != null) onSelected(selected);
  }

  @override
  Widget build(BuildContext context) {
    final effectiveTextStyle = textStyle ?? Theme.of(context).textTheme.labelMedium;

    final child = Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      padding: padding,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: Text(
              value ?? '',
              style: effectiveTextStyle,
              maxLines: 1,
              overflow: TextOverflow.fade,
              softWrap: false,
            ),
          ),
          const SizedBox(width: 4),
          Icon(Icons.arrow_drop_down, size: 16, color: effectiveTextStyle?.color),
        ],
      ),
    );

    if (maxWidth != null) {
      return GestureDetector(
        onTap: () => _openMenu(context),
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: maxWidth!),
          child: child,
        ),
      );
    }

    return GestureDetector(onTap: () => _openMenu(context), child: child);
  }
}

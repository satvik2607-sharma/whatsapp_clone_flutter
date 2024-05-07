import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final VoidCallback onTap;
  final IconData icon;
  final Color? iconColor;
  final double? iconSize;
  final double? minWidth;
  final Color? background;
  final BoxBorder? border;
  const CustomIconButton({
    super.key,
    required this.onTap,
    required this.icon,
    this.iconColor,
    this.iconSize,
    this.minWidth,
    this.background,
    this.border,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: background,
        shape: BoxShape.circle,
        border: border,
      ),
      child: IconButton(
        splashColor: Colors.transparent,
        splashRadius: (minWidth ?? 45) - 25,
        iconSize: iconSize ?? 22,
        constraints:
            BoxConstraints(minWidth: minWidth ?? 40, minHeight: minWidth ?? 45),
        padding: EdgeInsets.zero,
        onPressed: onTap,
        icon: Icon(
          icon,
          color: iconColor,
        ),
      ),
    );
  }
}

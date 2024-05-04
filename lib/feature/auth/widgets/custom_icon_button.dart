import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final VoidCallback onTap;
  final IconData icon;
  final Color? iconColor;
  final double? iconSize;
  final double? minWidth;
  const CustomIconButton({
    super.key,
    required this.onTap,
    required this.icon,
    this.iconColor,
    this.iconSize,
    this.minWidth,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      splashColor: Colors.transparent,
      iconSize: iconSize ?? 22,
      constraints: BoxConstraints(minWidth: minWidth ?? 40),
      padding: EdgeInsets.zero,
      onPressed: onTap,
      icon: Icon(
        icon,
        color: iconColor,
      ),
    );
  }
}

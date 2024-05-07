import 'package:flutter/material.dart';

class ShortHBar extends StatelessWidget {
  const ShortHBar({
    super.key,
    this.height,
    this.widget,
    this.color,
  });

  final double? height;
  final double? widget;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 4,
      width: widget ?? 25,
      margin: EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        color: color ?? Colors.grey!.withOpacity(0.2),
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}

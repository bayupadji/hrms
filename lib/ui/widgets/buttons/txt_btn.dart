import 'package:flutter/material.dart';
import 'package:hrms/utils/constans/color.dart';

class DefaultTextButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final Color bgColor;
  final Color fgColor;
  const DefaultTextButton({super.key, required this.label, required this.onPressed, required this.bgColor, required this.fgColor});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        foregroundColor: fgColor,
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        elevation: 0,
      ),
      onPressed: onPressed,
      child: Text(
        label,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
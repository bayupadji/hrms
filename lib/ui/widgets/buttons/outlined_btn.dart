import 'package:flutter/material.dart';
import 'package:hrms/utils/constans/color.dart';

class DefaultOutlinedButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final Color borderColor;
  final Color fgColor;
  const DefaultOutlinedButton({
    super.key, required this.label, required this.onPressed, required this.borderColor, required this.fgColor
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        side: BorderSide(color: borderColor),
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        elevation: 0,
        foregroundColor: fgColor,
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

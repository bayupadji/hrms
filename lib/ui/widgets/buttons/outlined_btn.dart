import 'package:flutter/material.dart';
import 'package:hrms/utils/color.dart';

class DefaultOutlinedButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  const DefaultOutlinedButton({
    super.key, required this.label, required this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        side: BorderSide(color: AppColors.primaryColor),
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        foregroundColor: AppColors.primaryColor,
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

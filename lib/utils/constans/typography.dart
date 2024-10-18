import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hrms/utils/constans/color.dart';

class AppTextStyles {
  // Define a custom TextTheme using Google Fonts
  static TextTheme textTheme = TextTheme(
    displayLarge: GoogleFonts.plusJakartaSans(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      color: AppColors.darkColor,
    ),
    displayMedium: GoogleFonts.plusJakartaSans(
      fontSize: 28,
      fontWeight: FontWeight.bold,
      color: AppColors.darkColor,
    ),
    displaySmall: GoogleFonts.plusJakartaSans(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: AppColors.darkColor,
    ),
    bodyLarge: GoogleFonts.plusJakartaSans(
      fontSize: 16,
      fontWeight: FontWeight.normal,
      color: AppColors.darkColor,
    ),
    bodyMedium: GoogleFonts.plusJakartaSans(
      fontSize: 14,
      fontWeight: FontWeight.normal,
      color: AppColors.darkColor,
    ),
    bodySmall: GoogleFonts.plusJakartaSans(
      fontSize: 12,
      fontWeight: FontWeight.normal,
      color: AppColors.darkColor,
    ),
    labelSmall: GoogleFonts.plusJakartaSans(
      fontSize: 10,
      fontWeight: FontWeight.normal,
      color: AppColors.darkColor,
    ),
  );
}

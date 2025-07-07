import 'package:flutter/material.dart';
import 'package:snack_track_app/theme/color_scheme.dart';
import 'package:snack_track_app/theme/text_styles.dart';

class AppTheme {
  static ThemeData get light {
    return ThemeData(
      colorScheme: const ColorScheme.light(
        primary: AppColors.primary,
        secondary: AppColors.secondary,
        background: AppColors.background,
        error: AppColors.error,
      ),
      scaffoldBackgroundColor: AppColors.background,
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      textTheme: const TextTheme(
        headlineSmall: AppTextStyles.heading,
        bodySmall: AppTextStyles.body,
      ),
      useMaterial3: true,
    );
  }
}

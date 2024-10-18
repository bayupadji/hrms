// lib/main.dart
import 'package:flutter/material.dart';
import 'package:hrms/data/repositories/auth/auth_repository.dart';
import 'package:hrms/domain/providers/auth/auth_provider.dart';
import 'package:hrms/domain/use_cases/login_usecase.dart';
import 'package:hrms/ui/screens/splash_screen.dart';
import 'package:provider/provider.dart';
import 'data/services/api_service.dart';
import 'domain/providers/forms/input_provider.dart';
import 'domain/providers/onboarding/onboarding_provider.dart';
import 'domain/providers/splashscreen/splash_provider.dart';
import 'utils/constans/color.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  final apiService = ApiService();
  final authRepository = AuthRepository(apiService);
  final loginUseCase = LoginUseCase(authRepository);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SplashProvider()),
        ChangeNotifierProvider(create: (_) => OnboardingProvider()),
        ChangeNotifierProvider(create: (_) => InputProvider()),
        ChangeNotifierProvider(create: (_) => AuthProvider(loginUseCase)),
      ],
      child: MaterialApp(
        theme: ThemeData(
          scaffoldBackgroundColor: AppColors.backgroundColor,
          textTheme: GoogleFonts.interTextTheme(),
        ),
        home: Scaffold(
          body: SafeArea(
            child: SplashScreens(), // Use LoginScreen as the initial screen
          ),
        ),
      ),
    ),
  );
}

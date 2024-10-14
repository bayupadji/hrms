import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hrms/domain/providers/onboarding_provider.dart';
import 'package:hrms/domain/providers/splash_provider.dart';
import 'package:hrms/ui/screens/splash_screen.dart';
import 'package:hrms/utils/color.dart';
import 'package:provider/provider.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // list of providers
        ChangeNotifierProvider(create: (_) => SplashProvider()),
        ChangeNotifierProvider(create: (_) => OnboardingProvider()),
      ],
      child: MaterialApp(
        theme: ThemeData(
          scaffoldBackgroundColor: AppColors.backgroundColor,
          textTheme: GoogleFonts.interTextTheme(),
        ),
        home: Scaffold(
          body: SafeArea(
            child: SplashScreens(),
          ),
        ),
      ),
    );
  }
}

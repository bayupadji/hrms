import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hrms/providers/forms/input_provider.dart';
import 'package:hrms/providers/onboarding/onboarding_provider.dart';
import 'package:hrms/providers/splashscreen/splash_provider.dart';
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
        ChangeNotifierProvider(create: (_) => InputProvider()),
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

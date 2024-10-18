import 'package:flutter/material.dart';
import 'package:hrms/ui/screens/onboarding_screen.dart';
import 'splash_state.dart';

class SplashProvider with ChangeNotifier {
  final SplashState _state = SplashState();

  bool get isLoading => _state.isLoading;

  Future<void> loadData(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 3));
    _state.isLoading = false;
    notifyListeners();

    // ignore: use_build_context_synchronously
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => OnboardingPage()),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:hrms/ui/screens/onboarding_screen.dart';

class SplashProvider with ChangeNotifier {
  bool _isLoading = true;

  bool get isLoading => _isLoading;

  Future<void> loadData(BuildContext context) async{
    await Future.delayed(const Duration(seconds: 3));
    _isLoading = false;
    notifyListeners();

    // ignore: use_build_context_synchronously
    Navigator.of(context).pushReplacement(MaterialPageRoute(
    builder: (context) => OnboardingPage(),
    ));
  }
}

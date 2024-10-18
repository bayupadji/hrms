import 'package:flutter/material.dart';
import 'package:hrms/data/repositories/onboarding/onboarding_repository.dart';
import 'package:hrms/domain/providers/onboarding/onboarding_state.dart';
import 'package:hrms/ui/screens/login_screen.dart';

class OnboardingProvider with ChangeNotifier {
  final PageController _pageController = PageController();
  final OnboardingState _state = OnboardingState();

  PageController get pageController => _pageController;
  int get currentPage => _state.currentPage;
  bool get isAutoScrolling => _state.isAutoScrolling;

  OnboardingProvider() {
    _startAutoScroll();
  }

  // Set the current page and notify listeners
  void setCurrentPage(int page) {
    _state.currentPage = page;
    notifyListeners();
  }

  // Start auto-scrolling through pages
  void _startAutoScroll() async {
    while (_state.isAutoScrolling) {
      await Future.delayed(Duration(seconds: 5));

      if (_state.currentPage < onboardingPages.length - 1) {
        _state.currentPage++;
        if (_pageController.hasClients) {
          _pageController.animateToPage(
            _state.currentPage,
            duration: Duration(milliseconds: 400),
            curve: Curves.easeInOut,
          );
        }
      } else {
        _state.currentPage = 0;
        if (_pageController.hasClients) {
          _pageController.jumpToPage(_state.currentPage);
        }
      }
      notifyListeners();
    }
  }

  // Stop auto-scrolling
  void stopAutoScroll() {
    _state.isAutoScrolling = false;
  }

  // Dispose resources
  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  // Handle moving to the login screen
  void onMove(BuildContext context) {
    stopAutoScroll();
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => LoginScreen()));
  }
}

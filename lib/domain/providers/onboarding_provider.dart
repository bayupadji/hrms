import 'package:flutter/material.dart';
import 'package:hrms/data/repositories/onboarding_repository.dart';
import 'package:hrms/ui/screens/login_screen.dart';

class OnboardingProvider with ChangeNotifier {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  bool _isAutoScrolling = true;

  PageController get pageController => _pageController;
  int get currentPage => _currentPage;

  OnboardingProvider() {
    _startAutoScroll();
  }

  void setCurrentPage(int page) {
    _currentPage = page;
    notifyListeners();
  }

  void _startAutoScroll() async {
    while (_isAutoScrolling) {
      await Future.delayed(Duration(seconds: 5));

      if (_currentPage < onboardingPages.length - 1) {
        _currentPage++;
        if (_pageController.hasClients) {
          _pageController.animateToPage(
            _currentPage,
            duration: Duration(milliseconds: 400),
            curve: Curves.easeInOut,
          );
        }
      } else {
        _currentPage = 0;
        if (_pageController.hasClients) {
          _pageController.jumpToPage(_currentPage);
        }
      }
      notifyListeners();
    }
  }

  void stopAutoScroll() {
    _isAutoScrolling = false;
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void onMove(BuildContext context) {
    stopAutoScroll();
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => LoginScreen()));
  }
}

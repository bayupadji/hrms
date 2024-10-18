import 'package:flutter/material.dart';
import 'package:hrms/domain/use_cases/login_usecase.dart';

class AuthProvider extends ChangeNotifier {
  final LoginUseCase loginUseCase;
  String? _errorMessage;

  String? get errorMessage => _errorMessage;

  AuthProvider(this.loginUseCase);

  Future<void> login(String email, String password) async {
    final user = await loginUseCase(email, password);
    if (user != null) {
      _errorMessage = null;
    } else {
      _errorMessage = 'Login failed';
    }
    notifyListeners();
  }
}

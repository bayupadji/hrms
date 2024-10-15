import 'package:flutter/material.dart';
import 'input_state.dart';
class InputProvider extends ChangeNotifier {
  late TextEditingController textController;
  late TextEditingController passwordController;
  late FocusNode textFocusNode;
  late FocusNode passwordFocusNode;

  final InputState _textState = InputState();
  final InputState _passwordState = InputState();

  InputProvider() {
    textController = TextEditingController();
    passwordController = TextEditingController();
    textFocusNode = FocusNode();
    passwordFocusNode = FocusNode();

    textFocusNode.addListener(() {
      _textState.isFocused = textFocusNode.hasFocus;
      notifyListeners();
    });

    passwordFocusNode.addListener(() {
      _passwordState.isFocused = passwordFocusNode.hasFocus;
      notifyListeners();
    });
  }

  // Getters untuk Text Field
  bool get isTextFocused => _textState.isFocused;
  bool get hasTextError => _textState.hasError;
  String? get textErrorMessage => _textState.errorMessage;

  // Getters untuk Password Field
  bool get isPasswordFocused => _passwordState.isFocused;
  bool get hasPasswordError => _passwordState.hasError;
  String? get passwordErrorMessage => _passwordState.errorMessage;
  bool get isPasswordVisible => _passwordState.isPasswordVisible;

  @override
  void dispose() {
    textController.dispose();
    passwordController.dispose();
    textFocusNode.dispose();
    passwordFocusNode.dispose();
    super.dispose();
  }

  // Validasi untuk Text Field
  void validateTextInput() {
    if (textController.text.isEmpty) {
      _textState.hasError = true;
      _textState.errorMessage = "Email cannot be empty";
    } else {
      _textState.hasError = false;
      _textState.errorMessage = null;
    }
    notifyListeners();
  }

  // Validasi untuk Password Field
  void validatePasswordInput() {
    if (passwordController.text.isEmpty) {
      _passwordState.hasError = true;
      _passwordState.errorMessage = "Password cannot be empty";
    } else {
      _passwordState.hasError = false;
      _passwordState.errorMessage = null;
    }
    notifyListeners();
  }

  // Fungsi untuk menghapus text di Text Field
  void clearText() {
    textController.clear();
    _textState.hasError = false;
    _textState.errorMessage = null;
    notifyListeners();
  }

  // Fungsi untuk menghapus text di Password Field
  void clearPassword() {
    passwordController.clear();
    _passwordState.hasError = false;
    _passwordState.errorMessage = null;
    notifyListeners();
  }

  // Fungsi untuk toggle visibility pada Password Field
  void togglePasswordVisibility() {
    _passwordState.isPasswordVisible = !_passwordState.isPasswordVisible;
    notifyListeners();
  }

  // Fungsi untuk set text di Text Field
  void setText(String text) {
    textController.text = text;
    validateTextInput();
  }

  // Fungsi untuk set text di Password Field
  void setPassword(String password) {
    passwordController.text = password;
    validatePasswordInput();
  }
}

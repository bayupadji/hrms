import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:hrms/providers/forms/input_provider.dart';
import 'package:hrms/utils/color.dart';

class InputFields extends StatelessWidget {
  final String label;
  final bool isPasswordField;

  const InputFields({
    super.key,
    required this.label,
    required this.isPasswordField,
  });

  @override
  Widget build(BuildContext context) {
    final inputProvider = Provider.of<InputProvider>(context);
    final controller = _getController(inputProvider);
    final focusNode = _getFocusNode(inputProvider);
    final hasError = _getHasError(inputProvider);
    final errorMessage = _getErrorMessage(inputProvider);
    final isFocused = _getIsFocused(inputProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildLabel(),
        const SizedBox(height: 8),
        _buildTextFormField(
          inputProvider,
          controller,
          focusNode,
          hasError,
          errorMessage,
          isFocused,
        ),
      ],
    );
  }

  // Fungsi untuk mendapatkan controller sesuai tipe input
  TextEditingController _getController(InputProvider inputProvider) {
    return isPasswordField
        ? inputProvider.passwordController
        : inputProvider.textController;
  }

  // Fungsi untuk mendapatkan focus node sesuai tipe input
  FocusNode _getFocusNode(InputProvider inputProvider) {
    return isPasswordField
        ? inputProvider.passwordFocusNode
        : inputProvider.textFocusNode;
  }

  // Fungsi untuk mendapatkan status error sesuai tipe input
  bool _getHasError(InputProvider inputProvider) {
    return isPasswordField
        ? inputProvider.hasPasswordError
        : inputProvider.hasTextError;
  }

  // Fungsi untuk mendapatkan pesan error sesuai tipe input
  String? _getErrorMessage(InputProvider inputProvider) {
    return isPasswordField
        ? inputProvider.passwordErrorMessage
        : inputProvider.textErrorMessage;
  }

  // Fungsi untuk mendapatkan status fokus sesuai tipe input
  bool _getIsFocused(InputProvider inputProvider) {
    return isPasswordField
        ? inputProvider.isPasswordFocused
        : inputProvider.isTextFocused;
  }

  // Fungsi untuk membangun label field
  Widget _buildLabel() {
    return Text(
      label,
      style: const TextStyle(
        fontWeight: FontWeight.w500,
      ),
    );
  }

  // Fungsi untuk membangun TextFormField dengan logika password dan error
  Widget _buildTextFormField(
    InputProvider inputProvider,
    TextEditingController controller,
    FocusNode focusNode,
    bool hasError,
    String? errorMessage,
    bool isFocused,
  ) {
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      obscureText: _shouldObscureText(inputProvider),
      decoration: _buildInputDecoration(
        inputProvider,
        hasError,
        errorMessage,
        isFocused,
      ),
      onFieldSubmitted: (_) => _handleFieldSubmitted(inputProvider),
      onChanged: (value) => _handleFieldChanged(inputProvider, value),
    );
  }

  // Fungsi untuk menentukan apakah teks harus disembunyikan (password field)
  bool _shouldObscureText(InputProvider inputProvider) {
    return isPasswordField && !inputProvider.isPasswordVisible;
  }

  // Fungsi untuk membangun InputDecoration dengan logika password dan error
  InputDecoration _buildInputDecoration(
    InputProvider inputProvider,
    bool hasError,
    String? errorMessage,
    bool isFocused,
  ) {
    return InputDecoration(
      suffixIcon:
          isPasswordField ? _buildPasswordToggleIcon(inputProvider) : null,
      border: _buildBorder(isFocused, hasError),
      enabledBorder: _buildEnabledBorder(hasError),
      focusedBorder: _buildFocusedBorder(),
      filled: true,
      fillColor: AppColors.backgroundColor,
      contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      errorText: hasError ? errorMessage : null,
    );
  }

  // Fungsi untuk membangun border input field
  OutlineInputBorder _buildBorder(bool isFocused, bool hasError) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        color: isFocused
            ? AppColors.primaryColor
            : (hasError ? AppColors.errorColor : AppColors.backgroundColor),
      ),
    );
  }

  // Fungsi untuk membangun border ketika input field tidak aktif
  OutlineInputBorder _buildEnabledBorder(bool hasError) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        color: hasError ? AppColors.errorColor : AppColors.greyColor,
      ),
    );
  }

  // Fungsi untuk membangun border ketika input field sedang aktif
  OutlineInputBorder _buildFocusedBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        color: AppColors.primaryColor,
      ),
    );
  }

  // Fungsi untuk membangun icon toggle visibility untuk password field
  Widget? _buildPasswordToggleIcon(InputProvider inputProvider) {
    return IconButton(
      icon: Icon(
        inputProvider.isPasswordVisible
            ? Icons.visibility_off_outlined
            : Icons.visibility_outlined,
      ),
      onPressed: inputProvider.togglePasswordVisibility,
    );
  }

  // Fungsi untuk menangani field submit
  void _handleFieldSubmitted(InputProvider inputProvider) {
    isPasswordField
        ? inputProvider.validatePasswordInput()
        : inputProvider.validateTextInput();
  }

  // Fungsi untuk menangani perubahan teks pada field
  void _handleFieldChanged(InputProvider inputProvider, String value) {
    isPasswordField
        ? inputProvider.setPassword(value)
        : inputProvider.setText(value);
  }
}

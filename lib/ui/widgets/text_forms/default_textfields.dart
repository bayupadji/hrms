import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:hrms/domain/providers/forms/input_provider.dart';
import 'package:hrms/utils/constans/color.dart';

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

  TextEditingController _getController(InputProvider inputProvider) {
    return isPasswordField
        ? inputProvider.passwordController
        : inputProvider.textController;
  }

  FocusNode _getFocusNode(InputProvider inputProvider) {
    return isPasswordField
        ? inputProvider.passwordFocusNode
        : inputProvider.textFocusNode;
  }

  bool _getHasError(InputProvider inputProvider) {
    return isPasswordField
        ? inputProvider.hasPasswordError
        : inputProvider.hasTextError;
  }

  String? _getErrorMessage(InputProvider inputProvider) {
    return isPasswordField
        ? inputProvider.passwordErrorMessage
        : inputProvider.textErrorMessage;
  }

  bool _getIsFocused(InputProvider inputProvider) {
    return isPasswordField
        ? inputProvider.isPasswordFocused
        : inputProvider.isTextFocused;
  }

  Widget _buildLabel() {
    return Text(
      label,
      style: const TextStyle(
        fontWeight: FontWeight.w500,
      ),
    );
  }

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

  bool _shouldObscureText(InputProvider inputProvider) {
    return isPasswordField && !inputProvider.isPasswordVisible;
  }

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

  OutlineInputBorder _buildEnabledBorder(bool hasError) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        color: hasError ? AppColors.errorColor : AppColors.greyColor,
      ),
    );
  }

  OutlineInputBorder _buildFocusedBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        color: AppColors.primaryColor,
      ),
    );
  }

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

  void _handleFieldSubmitted(InputProvider inputProvider) {
    isPasswordField
        ? inputProvider.validatePasswordInput()
        : inputProvider.validateTextInput(); // Change to validateEmailInput
  }

  void _handleFieldChanged(InputProvider inputProvider, String value) {
    isPasswordField
        ? inputProvider.setPassword(value)
        : inputProvider.setText(value); // Change to setEmail
  }
}

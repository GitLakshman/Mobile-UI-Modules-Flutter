import 'package:flutter/material.dart';
import '../../../core/constants/app_strings.dart';

/// Reusable login form widget
/// Handles email/password input and validation
class LoginForm extends StatefulWidget {
  final VoidCallback onSubmit;

  const LoginForm({
    super.key,
    required this.onSubmit,
  });

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  // Form key for validation
  final _formKey = GlobalKey<FormState>();
  
  // Controllers to get text from input fields
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  
  // Track password visibility
  bool _obscurePassword = true;
  
  // Track loading state during login
  bool _isLoading = false;

  @override
  void dispose() {
    // Clean up controllers when widget is disposed
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  /// Validate email format
  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return AppStrings.emailRequired;
    }
    // Simple email regex pattern
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value)) {
      return AppStrings.emailInvalid;
    }
    return null;
  }

  /// Validate password
  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return AppStrings.passwordRequired;
    }
    if (value.length < 6) {
      return AppStrings.passwordTooShort;
    }
    return null;
  }

  /// Handle form submission
  void _handleSubmit() async {
    // Validate all fields
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      // Simulate API call delay
      await Future.delayed(const Duration(seconds: 2));

      setState(() {
        _isLoading = false;
      });

      // Call the onSubmit callback
      widget.onSubmit();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Email field
          TextFormField(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              labelText: AppStrings.emailLabel,
              hintText: AppStrings.emailHint,
              prefixIcon: Icon(Icons.email_outlined),
            ),
            validator: _validateEmail,
            enabled: !_isLoading,
          ),
          const SizedBox(height: 16),

          // Password field
          TextFormField(
            controller: _passwordController,
            obscureText: _obscurePassword,
            decoration: InputDecoration(
              labelText: AppStrings.passwordLabel,
              hintText: AppStrings.passwordHint,
              prefixIcon: const Icon(Icons.lock_outlined),
              suffixIcon: IconButton(
                icon: Icon(
                  _obscurePassword ? Icons.visibility : Icons.visibility_off,
                ),
                onPressed: () {
                  setState(() {
                    _obscurePassword = !_obscurePassword;
                  });
                },
              ),
            ),
            validator: _validatePassword,
            enabled: !_isLoading,
          ),
          const SizedBox(height: 24),

          // Login button
          ElevatedButton(
            onPressed: _isLoading ? null : _handleSubmit,
            child: _isLoading
                ? const SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
                  )
                : const Text(AppStrings.loginButton),
          ),

          // Forgot password link
          const SizedBox(height: 12),
          TextButton(
            onPressed: _isLoading ? null : () {
              // Show a snackbar for demo purposes
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Forgot password feature coming soon!'),
                ),
              );
            },
            child: const Text(AppStrings.forgotPassword),
          ),
        ],
      ),
    );
  }
}

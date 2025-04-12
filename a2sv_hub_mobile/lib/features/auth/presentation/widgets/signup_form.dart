import 'package:a2sv_hub/core/presentation/widgets/input_field.dart';
import 'package:flutter/material.dart';

class SignupForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;

  const SignupForm({
    Key? key,
    required this.formKey,
    required this.emailController,
    required this.passwordController,
    required this.confirmPasswordController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          Input(
            controller: emailController,
            hint: 'Email Address',
            validator: (value) {
              if (value == null || value.isEmpty) return 'Email is required';
              const pattern = r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}$';
              return RegExp(pattern).hasMatch(value) ? null : 'Enter a valid email';
            },
          ),
          const SizedBox(height: 27),
          Input(
            controller: passwordController,
            hint: 'Password',
            isPassword: true,
            validator: (value) => value == null || value.isEmpty ? 'Password is required' : null,
          ),
          const SizedBox(height: 27),
          Input(
            controller: confirmPasswordController,
            hint: 'Confirm Password',
            isPassword: true,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Confirm Password is required';
              }
              if (value != passwordController.text) {
                return 'Passwords do not match';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}

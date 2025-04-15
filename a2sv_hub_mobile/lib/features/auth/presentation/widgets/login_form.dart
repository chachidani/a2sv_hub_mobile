import 'package:a2sv_hub/core/presentation/widgets/input_field.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  const LoginForm({
    Key? key,
    required this.formKey,
    required this.emailController,
    required this.passwordController,
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
        ],
      ),
    );
  }
}

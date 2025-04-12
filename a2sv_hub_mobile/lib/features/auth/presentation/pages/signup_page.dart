import 'package:a2sv_hub/core/presentation/routes/app_routes.dart';
import 'package:a2sv_hub/core/presentation/widgets/button.dart';
import 'package:a2sv_hub/features/auth/presentation/widgets/buttom_text.dart';
import 'package:a2sv_hub/features/auth/presentation/widgets/check_box.dart';
import 'package:a2sv_hub/features/auth/presentation/widgets/header.dart';
import 'package:a2sv_hub/features/auth/presentation/widgets/signup_form.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool rememberMe = true;

  void _submit() {
    if (_formKey.currentState?.validate() ?? false) {
      debugPrint('Email: ${_emailController.text}');
      debugPrint('Password: ${_passwordController.text}');
      debugPrint('Confirm Password: ${_confirmPasswordController.text}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Stack(
              children: [
                Positioned(
                  top: -209,
                  left: -208,
                  child: Container(
                    width: 459,
                    height: 409,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color(0xFFD9D9D9),
                          Color.fromARGB(255, 172, 204, 252)
                        ],
                        begin: Alignment.bottomRight,
                        end: Alignment.topLeft,
                      ),
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(499),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: -209,
                  right: -208,
                  child: Container(
                    width: 459,
                    height: 409,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color(0xFFD9D9D9),
                          Color.fromARGB(255, 172, 204, 252)
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(499),
                      ),
                    ),
                  ),
                ),
                SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 44.0, vertical: 110.0),
                  child: ConstrainedBox(
                    constraints:
                        BoxConstraints(minHeight: constraints.maxHeight),
                    child: IntrinsicHeight(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const LoginHeader(
                              welcomeMessage: "Welcome to A2SV Hub!"),
                          const SizedBox(height: 55),
                          const Text(
                            'Create your Account',
                            style: TextStyle(
                              fontSize: 27,
                              fontWeight: FontWeight.w700,
                              fontFamily: 'Poppins',
                              color: Colors.black,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 20),
                          SignupForm(
                            formKey: _formKey,
                            emailController: _emailController,
                            passwordController: _passwordController,
                            confirmPasswordController:
                                _confirmPasswordController,
                          ),
                          const SizedBox(height: 20),
                          CheckBoxRow(
                            rememberMe: rememberMe,
                            onRememberChanged: (value) {
                              setState(() => rememberMe = value ?? false);
                            },
                            onForgotTap: () =>
                                debugPrint("Forgot password tapped"),
                            rememberText: 'I accept the terms and conditions',
                            forgotText: '',
                          ),
                          const SizedBox(height: 45),
                          Button(
                            text: 'Sign Up',
                            onPressed: _submit,
                            color: const Color(0xFF2065D1),
                          ),
                          const SizedBox(height: 17),
                          ButtomText(
                            onTap: () {
                              context.go(Routes.login);
                            },
                            prompt: "Already Registered?",
                            actionText: "Login",
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

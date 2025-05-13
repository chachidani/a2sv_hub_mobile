import 'package:a2sv_hub/core/presentation/routes/app_routes.dart';
import 'package:a2sv_hub/core/presentation/widgets/button.dart';
import 'package:a2sv_hub/features/auth/presentation/widgets/buttom_text.dart';
import 'package:a2sv_hub/features/auth/presentation/widgets/check_box.dart';
import 'package:a2sv_hub/features/auth/presentation/widgets/header.dart';
import 'package:a2sv_hub/features/auth/presentation/widgets/login_form.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool rememberMe = true;

  // void _submit() {
  //   if (_formKey.currentState?.validate() ?? false) {
  //     debugPrint('Email: ${_emailController.text}');
  //     debugPrint('Password: ${_passwordController.text}');
  //   }
  // }

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
                            welcomeMessage: "Welcome Back!",
                          ),
                          const SizedBox(height: 60),
                          const Text(
                            'Login to your Account',
                            style: TextStyle(
                              fontSize: 27,
                              fontWeight: FontWeight.w700,
                              fontFamily: 'Poppins',
                              color: Colors.black,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 20),
                          LoginForm(
                            formKey: _formKey,
                            emailController: _emailController,
                            passwordController: _passwordController,
                          ),
                          const SizedBox(height: 35),
                          CheckBoxRow(
                            rememberMe: rememberMe,
                            onRememberChanged: (value) {
                              setState(() => rememberMe = value ?? false);
                            },
                            onForgotTap: () =>
                                debugPrint("Forgot password tapped"),
                            rememberText: 'Remember me',
                            forgotText: 'Forgot Password?',
                          ),
                          const SizedBox(height: 70),
                          Button(
                            text: 'Login',
                            onPressed: () {
                              _login(context);
                              context.go(Routes.home);
                            },
                            color: const Color(0xFF2065D1),
                            text_color: Colors.white,
                          ),
                          const SizedBox(height: 17),
                          ButtomText(
                            onTap: () {
                              context.go(Routes.signup);
                            },
                            prompt: "Don’t have an account?",
                            actionText: "Sign Up",
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

  void _login(BuildContext context) {
    context.go(Routes.contests);
    // context.read<AuthBloc>().add(
    //       AuthLoginEvent(_emailController.text, _passwordController.text),
    //     );
  }
}

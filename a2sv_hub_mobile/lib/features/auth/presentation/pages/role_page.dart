import 'package:a2sv_hub/core/presentation/widgets/button.dart';
import 'package:a2sv_hub/features/auth/presentation/widgets/buttom_text.dart';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RolePage extends StatefulWidget {
  const RolePage({super.key});

  @override
  State<RolePage> createState() => _RolePageState();
}

class _RolePageState extends State<RolePage> {
  int selectedIndex = 0;

  final roles = [
    {
      'label': "I'm a Student",
      'imagePath': 'assets/images/student_icon.jpg',
    },
    {
      'label': "I'm a Class Head",
      'imagePath': 'assets/images/head_icon.jpg',
    },
    {
      'label': "I'm an Academy Lead",
      'imagePath': 'assets/images/academy_icon.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              // Top space for status bar
              const SizedBox(height: 50),

              // Logo
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    image: AssetImage('assets/images/africa_a2sv.png'),
                    height: 36,
                  ),
                  SizedBox(width: 10),
                  Image(
                    image: AssetImage('assets/images/hub.png'),
                    height: 36,
                  ),
                ],
              ),

              const SizedBox(height: 30),

              // Title
              const Text(
                'Join as a Student or Class Head\nor Academy Lead',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black87,
                  fontFamily: 'Roboto',
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),

              const SizedBox(height: 30),

              // Role options
              for (int index = 0; index < roles.length; index++)
                Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: InkWell(
                    onTap: () => setState(() => selectedIndex = index),
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      height: 116,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: selectedIndex == index
                              ? Colors.blue
                              : Colors.grey.shade300,
                        ),
                        borderRadius: BorderRadius.circular(12),
                        color: selectedIndex == index
                            ? Colors.blue.shade50
                            : Colors.white,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset(
                                roles[index]['imagePath'] as String,
                                width: 50,
                                height: 50,
                              ),
                              const SizedBox(width: 12),
                              Radio<int>(
                                materialTapTargetSize:
                                    MaterialTapTargetSize.shrinkWrap,
                                value: index,
                                groupValue: selectedIndex,
                                onChanged: (value) =>
                                    setState(() => selectedIndex = value!),
                                activeColor: Colors.blue,
                              ),
                            ],
                          ),
                          Expanded(
                            child: Text(
                              roles[index]['label'] as String,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                fontFamily: 'Roboto',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

              const SizedBox(height: 30),

              // Create Account button
              Button(
                text: 'Create Account',
                onPressed: () {
                  context.go('/signup', extra: selectedIndex);
                },
                color: const Color(0xFF2065D1),
                text_color: Colors.white,
              ),

              const SizedBox(height: 12),

              // Login text
              ButtomText(
                prompt: 'Already Registered?',
                actionText: 'Login',
                onTap: () {
                  context.go('/login');
                },
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}

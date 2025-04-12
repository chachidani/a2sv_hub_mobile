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
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Stack(
              children: [
                // Top-left sphere
                Positioned(
                  top: -229,
                  left: -228,
                  child: Container(
                    width: 499,
                    height: 459,
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
                // Bottom-right sphere
                Positioned(
                  bottom: -229,
                  right: -228,
                  child: Container(
                    width: 499,
                    height: 459,
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
                // Scroll content
                SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 48),
                    child: ConstrainedBox(
                      constraints:
                          BoxConstraints(minHeight: constraints.maxHeight),
                      child: IntrinsicHeight(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Center(
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image(
                                        image: AssetImage(
                                            'assets/images/africa_a2sv.png'),
                                        height: 36,
                                      ),
                                      SizedBox(width: 10),
                                      Image(
                                        image:
                                            AssetImage('assets/images/hub.png'),
                                        height: 36,
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 35),
                                  Text(
                                    'Join as a Student or Class Head\nor Academy Lead',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.black87,
                                      fontFamily: 'Roboto',
                                      fontSize: 22,
                                      fontWeight: FontWeight.w700,
                                      height: 1.5,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 40),
                            Column(
                              children: List.generate(roles.length, (index) {
                                return Container(
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 8),
                                  child: GestureDetector(
                                    onTap: () =>
                                        setState(() => selectedIndex = index),
                                    child: Container(
                                      height: 116,
                                      padding: const EdgeInsets.all(16),
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Row(
                                            children: [
                                              Image.asset(
                                                roles[index]['imagePath']
                                                    as String,
                                                width: 40,
                                                height: 45,
                                              ),
                                              const Spacer(),
                                              Radio<int>(
                                                value: index,
                                                groupValue: selectedIndex,
                                                onChanged: (value) => setState(
                                                    () =>
                                                        selectedIndex = value!),
                                                activeColor: Colors.blue,
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 5),
                                          Text(
                                            roles[index]['label'] as String,
                                            style: const TextStyle(
                                              fontSize: 22,
                                              fontWeight: FontWeight.w700,
                                              fontFamily: 'Roboto',
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              }),
                            ),
                            const SizedBox(height: 50),
                            Button(
                              text: 'Create Account',
                              onPressed: () {
                                context.go('/signup', extra: selectedIndex);
                              },
                            ),
                            const SizedBox(height: 17),
                            ButtomText(
                              prompt: 'Already Registered?',
                              actionText: 'Login',
                              onTap: () {
                                context.go('/login');
                              },
                            ),
                            const SizedBox(height: 32),
                          ],
                        ),
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

import 'package:flutter/material.dart';
import 'custom_button.dart';

class WelcomeCard extends StatelessWidget {
  final String title;
  final String username;
  final String? subtitle;
  final VoidCallback onProblemsTap;

  const WelcomeCard({
    Key? key,
    required this.title,
    required this.username,
    this.subtitle,
    required this.onProblemsTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: const Color(0xFFBEE3F8),
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Top section - Welcome text
          Text(
            title,
            style: const TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4.0),
          Text(
            'Welcome back,',
            style: TextStyle(
              fontSize: 14.0,
              color: Colors.grey.shade700,
            ),
          ),
          Text(
            username,
            style: TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.bold,
              color: Colors.grey.shade700,
            ),
          ),

          const SizedBox(height: 16.0),

          // Problems button
          CustomButton(
            text: 'Problems',
            onPressed: onProblemsTap,
            width: 120.0,
            height: 40.0,
          ),

          const SizedBox(height: 16.0),

          // Illustration
          Center(
            child: Image.asset(
              'assets/images/stats_illustration.png',
              height: 150.0,
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }
}

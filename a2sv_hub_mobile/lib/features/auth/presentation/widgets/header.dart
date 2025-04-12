import 'package:flutter/material.dart';

class LoginHeader extends StatelessWidget {
  final String welcomeMessage;

  const LoginHeader({
    Key? key,
    required this.welcomeMessage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
              image: AssetImage('assets/images/africa_a2sv.png'),
              height: 52,
              ),
              SizedBox(width: 10),
              Image(
              image: AssetImage('assets/images/hub.png'),
              height: 52,
              ),
            ],
          ),
          const SizedBox(height: 40),
          Text(
            welcomeMessage,
            style: const TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.w700,
              height: 1.2,
              letterSpacing: 2.0,
              fontFamily: 'Poppins',
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

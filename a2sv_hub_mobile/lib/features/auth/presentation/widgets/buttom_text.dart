import 'package:flutter/material.dart';

class ButtomText extends StatelessWidget {
  final String prompt;
  final String actionText;
  final VoidCallback onTap;

  const ButtomText({
    Key? key,
    required this.prompt,
    required this.actionText,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          prompt,
          style: const TextStyle(
            color: Color(0xFF8C8787),
            fontSize: 17,
            fontFamily: 'Roboto',
          ),
        ),
        const SizedBox(width: 10),
        GestureDetector(
          onTap: onTap,
          child: Text(
            actionText,
            style: const TextStyle(
              color: Color(0xFF2065D1),
              fontSize: 17,
              fontFamily: 'Roboto',
            ),
          ),
        ),
      ],
    );
  }
}

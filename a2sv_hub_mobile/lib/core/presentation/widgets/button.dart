import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String text;
  final void Function() onPressed;
  final Color color;

  const Button({
    super.key,
    required this.text,
    required this.onPressed,
    this.color = const Color(0xFF2065D1),
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 57,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          backgroundColor: color,
          side: BorderSide(color: color, width: 2),
          shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontFamily: 'Inter_28pt',
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}


import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String text;
  final void Function() onPressed;
  final Color color;
  final Color text_color;

  const Button({
    super.key,
    required this.text,
    required this.onPressed,
    required this.color,
    required this.text_color,
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
          side: BorderSide(color: color),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: text_color,
            fontFamily: 'Inter_28pt',
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}

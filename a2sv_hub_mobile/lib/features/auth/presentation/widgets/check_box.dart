import 'package:flutter/material.dart';

class CheckBoxRow extends StatelessWidget {
  final bool rememberMe;
  final ValueChanged<bool?> onRememberChanged;
  final VoidCallback onForgotTap;
  final String rememberText;
  final String? forgotText;

  const CheckBoxRow({
    Key? key,
    required this.rememberMe,
    required this.onRememberChanged,
    required this.onForgotTap,
    required this.rememberText,
    required this.forgotText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: rememberMe,
          onChanged: onRememberChanged,
          activeColor: const Color(0xFF2065D1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.0),
          ),
        ),
        Text(
          rememberText,
          style: const TextStyle(
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w400,
            fontSize: 19,
            height: 1.05,
            color: Colors.black,
          ),
        ),
        const Spacer(),
        InkWell(
          onTap: onForgotTap,
          child: Text(
            forgotText ?? '',
            style: const TextStyle(
              color: Color(0xFF8C8787),
              fontSize: 19,
              fontFamily: 'Roboto',
            ),
          ),
        ),
      ],
    );
  }
}

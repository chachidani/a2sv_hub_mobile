import 'package:flutter/material.dart';

class Input extends StatelessWidget {
  const Input({
    super.key,
    required this.controller,
    this.hint,
    this.maxLines,
    this.keyboardType,
    this.validator,
    this.isPassword = false,
    this.isMultiline = false,
  });

  final TextEditingController controller;
  final String? hint;
  final bool isPassword;
  final bool isMultiline;
  final int? maxLines;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 5),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          height: isMultiline ? 100 : 57,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
                color: const Color(0x1B8B88FF),
              width: 2,
            ),
          ),
          alignment: Alignment.center,
          child: TextFormField(
            controller: controller,
            obscureText: isPassword,
            maxLines: maxLines ?? (isMultiline ? 5 : 1),
            keyboardType: keyboardType ??
                (isMultiline ? TextInputType.multiline : TextInputType.text),
            validator: validator,
            decoration: InputDecoration(
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide.none,
              ),
              hintText: hint,
                hintStyle: const TextStyle(
                  color: Color(0xFF8C8787), 
                  fontSize: 19,
                  height: 1.05,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                ),
              contentPadding: EdgeInsets.symmetric(
                  vertical: isMultiline ? 10 : 2, horizontal: 32),
              focusColor: Theme.of(context).colorScheme.primary,
              floatingLabelBehavior: FloatingLabelBehavior.never,
            ),
          ),
        ),
      ],
    );
  }
}

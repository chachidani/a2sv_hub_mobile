import 'package:flutter/material.dart';

class ProfileStat extends StatelessWidget {
  final String label;
  final String value;
  final Color? valueColor;
  final IconData? icon;
  final Color? iconColor;

  const ProfileStat({
    Key? key,
    required this.label,
    required this.value,
    this.valueColor,
    this.icon,
    this.iconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Value
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null) ...[
              Icon(
                icon!,
                color: iconColor ?? Colors.grey.shade700,
                size: 16.0,
              ),
              const SizedBox(width: 4.0),
            ],
            Text(
              value,
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: valueColor ?? Colors.black,
              ),
            ),
          ],
        ),
        const SizedBox(height: 4.0),

        // Label
        Text(
          label,
          style: TextStyle(
            fontSize: 14.0,
            color: Colors.grey.shade700,
          ),
        ),
      ],
    );
  }
}

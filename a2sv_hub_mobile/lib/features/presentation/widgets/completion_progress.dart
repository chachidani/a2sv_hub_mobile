import 'package:flutter/material.dart';

class CompletionProgress extends StatelessWidget {
  final String title;
  final String details;
  final double progressValue;
  final Color progressColor;

  const CompletionProgress({
    Key? key,
    required this.title,
    required this.details,
    required this.progressValue,
    this.progressColor = const Color(0xFFECC94B), // Gold color by default
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8.0),
          ClipRRect(
            borderRadius: BorderRadius.circular(4.0),
            child: LinearProgressIndicator(
              value: progressValue,
              minHeight: 10.0,
              backgroundColor: const Color(0xFFEFE6C5),
              valueColor: AlwaysStoppedAnimation<Color>(progressColor),
            ),
          ),
          const SizedBox(height: 8.0),
          Text(
            details,
            style: const TextStyle(
              fontSize: 12.0,
              color: Colors.black54,
            ),
          ),
        ],
      ),
    );
  }
}

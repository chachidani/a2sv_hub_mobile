import 'package:flutter/material.dart';

class NotificationItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final String timeAgo;

  const NotificationItem({
    super.key,
    required this.title,
    required this.subtitle,
    required this.timeAgo,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 30,
            height: 30,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 233, 231, 231),
              shape: BoxShape.circle,
            ),
            child: const Center(
              child: Image(
                image: AssetImage('assets/images/share_noti.jpg'),
                width: 20,
                height: 20,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: '$title ',
                        style: const TextStyle(
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                          fontFamily: 'Roboto',
                        ),
                      ),
                      TextSpan(
                        text: '‘$subtitle’ just got added',
                        style: const TextStyle(
                          color: Color(0xFF8C8787),
                          fontFamily: 'Roboto',
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(
                      Icons.access_time,
                      size: 12,
                      color: Color(0xFF8C8787),
                    ),
                    const SizedBox(width: 5),
                    Text(
                      timeAgo,
                      style: const TextStyle(
                        color: Color(0xFF8C8787),
                        fontSize: 12,
                        fontFamily: 'Roboto',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

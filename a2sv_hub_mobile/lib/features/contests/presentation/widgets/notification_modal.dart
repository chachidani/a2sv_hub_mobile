import 'package:a2sv_hub/features/contests/presentation/widgets/notification_item.dart';
import 'package:flutter/material.dart';

class NotificationModal extends StatelessWidget {
  const NotificationModal({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 60,
      right: 16,
      child: Container(
        width: 380,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 10,
            ),
          ],
        ),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Notifications',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        height: 1.02,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'You have 3 unread',
                      style: TextStyle(
                        color: Color(0xFF8C8787),
                        fontSize: 14,
                        fontFamily: 'Roboto',
                      ),
                    ),
                  ],
                ),
                Spacer(),
                Image(
                  image: AssetImage('assets/images/right.jpg'),
                  height: 24,
                  width: 24,
                ),
                SizedBox(width: 11),
                Image(
                  image: AssetImage('assets/images/setting.jpg'),
                  height: 24,
                  width: 24,
                ),
              ],
            ),
            SizedBox(height: 31),
            Text(
              'NEW',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 14,
                fontWeight: FontWeight.w400,
                height: 1.02,
              ),
            ),
            Divider(height: 20),
            NotificationItem(
              title: 'New Problem',
              subtitle: 'Count Number of Complete Components',
              timeAgo: 'about 21 hours ago',
            ),
            NotificationItem(
              title: 'New Problem',
              subtitle: '3. Longest Substring Without Repeating Characters',
              timeAgo: 'about 21 hours ago',
            ),
            NotificationItem(
              title: 'New Problem',
              subtitle: 'Count Number of Complete Components',
              timeAgo: 'about 21 hours ago',
            ),
          ],
        ),
      ),
    );
  }
}

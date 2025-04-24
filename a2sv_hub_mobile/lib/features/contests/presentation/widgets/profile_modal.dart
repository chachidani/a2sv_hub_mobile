import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProfileModal extends StatelessWidget {
  const ProfileModal({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 60,
      right: 16,
      child: Container(
        width: MediaQuery.of(context).size.width / 2,
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Amy Santiago',
                  style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF444444)),
                ),
                SizedBox(height: 4),
                Text('amy.santiago@a2sv.org',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF8C8787),
                      height: 1.5,
                    )),
              ],
            ),
            const Divider(height: 20),
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('Home'),
              onTap: () {},
            ),
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('Profile'),
              onTap: () {
                context.go('/profile');
              },
            ),
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('Settings'),
              onTap: () {},
            ),
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('Sync Leetcode'),
              onTap: () {},
            ),
            const Divider(height: 20),
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text(
                'Logout',
                style: TextStyle(
                  color: Colors.red,
                  fontFamily: 'Roboto',
                  fontSize: 14,
                ),
              ),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}

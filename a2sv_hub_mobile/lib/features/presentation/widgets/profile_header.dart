import 'package:flutter/material.dart';

class ProfileHeader extends StatelessWidget {
  final String name;
  final String role;
  final String? roleTag;
  final String? avatarUrl;
  final VoidCallback? onEditPressed;

  const ProfileHeader({
    Key? key,
    required this.name,
    required this.role,
    this.roleTag,
    this.avatarUrl,
    this.onEditPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Use default image path if none provided
    final String imagePath = avatarUrl ?? 'assets/images/profile.png';

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
      decoration: BoxDecoration(
        color: const Color(0xFF061B64),
        borderRadius:
            const BorderRadius.vertical(top: Radius.circular(16.0)),
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            const Color(0xFF061B64).withOpacity(0.85),
            BlendMode.srcOver,
          ),
        ),
      ),
      child: Column(
        children: [
          // Profile avatar
          CircleAvatar(
            radius: 40.0,
            backgroundImage: AssetImage(imagePath),
          ),
          const SizedBox(height: 12.0),

          // Name
          Text(
            name,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 22.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4.0),

          // Role and tag
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                role,
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 16.0,
                ),
              ),
              if (roleTag != null) ...[
                const SizedBox(width: 8.0),
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 2.0),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade700,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Text(
                    roleTag!,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12.0,
                    ),
                  ),
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}

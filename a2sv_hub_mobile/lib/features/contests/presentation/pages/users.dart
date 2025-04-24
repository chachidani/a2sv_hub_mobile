import 'package:a2sv_hub/features/contests/presentation/widgets/contest_progress_card.dart';
import 'package:a2sv_hub/features/contests/presentation/widgets/header.dart';
import 'package:a2sv_hub/features/contests/presentation/widgets/notification_modal.dart';
import 'package:a2sv_hub/features/contests/presentation/widgets/profile_modal.dart';
import 'package:a2sv_hub/features/contests/presentation/widgets/user_info_card.dart';
import 'package:flutter/material.dart';

class UsersPage extends StatefulWidget {
  const UsersPage({super.key});

  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  bool showNotifications = false;
  bool showProfileMenu = false;

  void toggleNotifications() {
    setState(() {
      showNotifications = !showNotifications;
      showProfileMenu = false;
    });
  }

  void toggleProfileMenu() {
    setState(() {
      showProfileMenu = !showProfileMenu;
      showNotifications = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ContestHeader(
                      onNotificationTap: toggleNotifications,
                      onProfileTap: toggleProfileMenu,
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Groups & Users',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        height: 0.9,
                        letterSpacing: 0.01,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'All',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF444444),
                      ),
                    ),
                    const SizedBox(height: 40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          height: 50,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.white,
                                blurRadius: 10,
                              ),
                            ],
                          ),
                          child: const Text(
                            'Users',
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Container(
                          height: 50,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.white,
                                blurRadius: 10,
                              ),
                            ],
                          ),
                          child: const Text(
                            'Groups',
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'Search user...',
                        prefixIcon: const Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Color(0x63738130),
                          ),
                        ),
                      ),
                      style: const TextStyle(height: 1.4),
                    ),
                    const SizedBox(height: 16),
                    DropdownButtonFormField<String>(
                      value: 'All',
                      items: ['All', 'Students', 'Teachers'].map((e) {
                        return DropdownMenuItem(value: e, child: Text(e));
                      }).toList(),
                      onChanged: (val) {},
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                    const SizedBox(height: 24),
                    SizedBox(
                      height: 500,
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        elevation: 4,
                        child: Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                  image: const AssetImage(
                                      'assets/images/africa_a2sv.png'),
                                  fit: BoxFit.cover,
                                  colorFilter: ColorFilter.mode(
                                    Colors.black.withOpacity(0.5),
                                    BlendMode.darken,
                                  ),
                                ),
                              ),
                            ),
                            const Align(
                              alignment: Alignment.center,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CircleAvatar(
                                    backgroundImage: AssetImage(
                                        'assets/images/africa_a2sv.png'),
                                    radius: 40,
                                  ),
                                  SizedBox(height: 12),
                                  Text('Amy Santiago Watson',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white)),
                                  SizedBox(height: 4),
                                  Text(
                                    'Student',
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.white70),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 12.0),
                child: Image.asset(
                  'assets/images/theme.jpg',
                  width: 50,
                  height: 50,
                ),
              ),
            ),
            if (showNotifications) const NotificationModal(),
            if (showProfileMenu) const ProfileModal(),
          ],
        ),
      ),
    );
  }
}

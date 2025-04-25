import 'package:a2sv_hub/features/contests/presentation/widgets/header.dart';
import 'package:a2sv_hub/features/contests/presentation/widgets/notification_modal.dart';
import 'package:a2sv_hub/features/contests/presentation/widgets/profile_modal.dart';
import 'package:a2sv_hub/features/presentation/widgets/profile_tab_bar.dart';
import 'package:flutter/material.dart';

class UsersPage extends StatefulWidget {
  const UsersPage({super.key});

  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  int _selectedTabIndex = 0;
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
            Padding(
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
                  ProfileTabBar(
                    tabs: const ['Users', 'Groups'],
                    selectedIndex: _selectedTabIndex,
                    onTabSelected: (index) {
                      setState(() {
                        _selectedTabIndex = index;
                      });
                    },
                  ),
                  const SizedBox(height: 16),
                  Expanded(
                    child: _buildTabContent(),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 12.0),
                child: Image.asset(
                  'assets/images/themee.png',
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

  Widget _buildTabContent() {
    if (_selectedTabIndex == 0) {
      return _buildUsersTabContent();
    } else {
      return _buildGroupTabContent();
    }
  }

  Widget _buildUsersTabContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              width: 187,
              height: 48,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                color: const Color(0xFF2065D1).withOpacity(0.07),
                borderRadius: BorderRadius.circular(4),
              ),
              child: const Image(
                image: AssetImage('assets/images/go.png'),
                height: 16,
                width: 16,
              ),
            ),
            Container(
              width: 187,
              height: 48,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4),
              ),
              child: const Image(
                image: AssetImage('assets/images/Frame@2x.png'),
                height: 15,
                width: 15,
              ),
            ),
          ],
        ),
        const SizedBox(height: 25),
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
          style: const TextStyle(height: 2.0),
        ),
        const SizedBox(height: 25),
        DropdownButtonFormField<String>(
          value: 'All',
          items: ['All', 'Students', 'Teachers'].map((e) {
            return DropdownMenuItem(value: e, child: Text(e));
          }).toList(),
          onChanged: (val) {},
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        const SizedBox(height: 40),
        SingleChildScrollView(
          child: SizedBox(
            height: 450,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              elevation: 4,
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(
                        colors: [
                          Colors.white,
                          Colors.white,
                          Colors.black.withOpacity(0.5),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: const [0, 0.5, 1],
                      ),
                      image: DecorationImage(
                        image:
                            const AssetImage('assets/images/africa_a2sv.png'),
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
                          backgroundImage:
                              AssetImage('assets/images/africa_a2sv.png'),
                          radius: 40,
                        ),
                        SizedBox(height: 12),
                        Text(
                          'Amy Santiago Watson',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Student',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildGroupTabContent() {
    return const Center(
      child: Text('Groups Tab Content'),
    );
  }
}

import 'package:a2sv_hub/core/presentation/widgets/dropdown.dart';
import 'package:a2sv_hub/features/contests/presentation/widgets/header.dart';
import 'package:a2sv_hub/features/contests/presentation/widgets/notification_modal.dart';
import 'package:a2sv_hub/features/contests/presentation/widgets/profile_modal.dart';
import 'package:a2sv_hub/features/presentation/widgets/profile_tab_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
                  const SizedBox(height: 40),
                ],
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

  Widget _buildTabContent() {
    if (_selectedTabIndex == 0) {
      return _buildUsersTabContent();
    } else {
      return _buildGroupTabContent();
    }
  }

  Widget _buildUsersTabContent() {
    final users = List.generate(
      5,
      (index) => {
        'name': 'User $index',
        'role': 'Student',
        'group': 'G${index + 1}k',
        'image': 'assets/images/africa_a2sv.png',
      },
    );

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
              borderSide: const BorderSide(color: Color(0x63738130)),
            ),
          ),
          style: const TextStyle(height: 1.6),
        ),
        const SizedBox(height: 25),
        CustomDropdown(
          value: 'All',
          items: const ['All', 'Students', 'Heads'],
          onChanged: (String? value) {},
        ),
        const SizedBox(height: 25),
        Expanded(
          child: ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              final user = users[index];
              return Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  elevation: 4,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 200,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(20),
                              ),
                              image: DecorationImage(
                                image: AssetImage(user['image']!),
                                fit: BoxFit.cover,
                                colorFilter: ColorFilter.mode(
                                  Colors.black.withOpacity(0.5),
                                  BlendMode.darken,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: 300,
                            padding: const EdgeInsets.all(20),
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: const BorderRadius.vertical(
                                bottom: Radius.circular(20),
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const SizedBox(height: 35),
                                Text(
                                  user['name']!,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                const SizedBox(height: 1),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      user['role']!,
                                      style: const TextStyle(
                                        fontSize: 16,
                                        color: Color(0xFF637381),
                                      ),
                                    ),
                                    const SizedBox(width: 13),
                                    Text(
                                      user['group']!,
                                      style: const TextStyle(
                                        fontSize: 16,
                                        color: Color(0xFF637381),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 20),
                                const Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image(
                                      image:
                                          AssetImage('assets/images/Frame.png'),
                                      height: 20,
                                      width: 20,
                                    ),
                                    SizedBox(width: 20),
                                    Image(
                                      image: AssetImage(
                                          'assets/images/Frame (1).png'),
                                      height: 20,
                                      width: 20,
                                    ),
                                    SizedBox(width: 20),
                                    Image(
                                      image: AssetImage(
                                          'assets/images/Frame (2).png'),
                                      height: 20,
                                      width: 20,
                                    ),
                                    SizedBox(width: 20),
                                    Image(
                                      image: AssetImage(
                                          'assets/images/Frame (3).png'),
                                      height: 20,
                                      width: 20,
                                    ),
                                    SizedBox(width: 20),
                                    Image(
                                      image: AssetImage(
                                          'assets/images/Frame (4).png'),
                                      height: 20,
                                      width: 20,
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 30),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Column(
                                      children: [
                                        Text(
                                          'Problems',
                                          style: TextStyle(
                                            fontFamily: 'Roboto',
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                            color:
                                                Colors.black.withOpacity(0.5),
                                          ),
                                        ),
                                        const SizedBox(height: 10),
                                        Text(
                                          '132',
                                          style: TextStyle(
                                            fontFamily: 'Roboto',
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                            color:
                                                Colors.black.withOpacity(0.5),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(width: 20),
                                    Column(
                                      children: [
                                        Text(
                                          'Submissions',
                                          style: TextStyle(
                                            fontFamily: 'Roboto',
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                            color:
                                                Colors.black.withOpacity(0.5),
                                          ),
                                        ),
                                        const SizedBox(height: 10),
                                        Text(
                                          '138',
                                          style: TextStyle(
                                            fontFamily: 'Roboto',
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                            color:
                                                Colors.black.withOpacity(0.5),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(width: 20),
                                    Column(
                                      children: [
                                        Text(
                                          'Dedicated Time',
                                          style: TextStyle(
                                            fontFamily: 'Roboto',
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                            color:
                                                Colors.black.withOpacity(0.5),
                                          ),
                                        ),
                                        const SizedBox(height: 10),
                                        Text(
                                          '1.93k',
                                          style: TextStyle(
                                            fontFamily: 'Roboto',
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                            color:
                                                Colors.black.withOpacity(0.5),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 20),
                                GestureDetector(
                                  onTap: () {
                                    context.go('/profile');
                                  },
                                  child: const Text(
                                    'View Profile',
                                    style: TextStyle(
                                      fontFamily: 'Roboto',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xFF2065D1),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Positioned(
                        top: 165,
                        child: Align(
                          alignment: Alignment.center,
                          child: CircleAvatar(
                            backgroundImage: AssetImage(user['image']!),
                            radius: 35,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildGroupTabContent() {
    final List<Map<String, dynamic>> groups = [
      {
        'name': 'AAiT Group 51',
        'code': 'G51',
        'members': 20,
        'timeSpent': 202450,
        'avgRating': 1405,
      },
      {
        'name': 'Ghana Group 60',
        'code': 'G51',
        'members': 20,
        'timeSpent': 202450,
        'avgRating': 1405,
      },
      {
        'name': 'AAiT Group 51',
        'code': 'G51',
        'members': 20,
        'timeSpent': 202450,
        'avgRating': 1405,
      },
    ];
    return ListView.builder(
      itemCount: groups.length,
      itemBuilder: (context, index) {
        final group = groups[index];
        final bool isSelected = index == 0;

        return Container(
          height: 287,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            border: Border.all(
              color: isSelected ? Colors.blue : Colors.grey.shade300,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 27.0,
              vertical: 37.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(group['name'],
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold)),
                const SizedBox(height: 11),
                Text(
                  '${group['code']} · ${group['members']} Members',
                  style: const TextStyle(
                    color: Color(0xFF637381),
                  ),
                ),
                const SizedBox(height: 90),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Image(
                      image: AssetImage('assets/images/Rectangle 549.png'),
                      height: 40,
                      width: 3,
                    ),
                    const SizedBox(width: 10),
                    Column(
                      children: [
                        const Text(
                          'Time Spent',
                          style: const TextStyle(
                            fontSize: 12,
                            color: Color(0xFF637381),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '${group['timeSpent']}',
                          style: const TextStyle(
                            fontSize: 12,
                            color: Color(0xFF637381),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 40),
                    const Image(
                      image: AssetImage('assets/images/Rectangle 549.png'),
                      height: 40,
                      width: 3,
                    ),
                    const SizedBox(width: 10),
                    Column(
                      children: [
                        const Text(
                          'Avg. Rating',
                          style: const TextStyle(
                            fontSize: 12,
                            color: Color(0xFF637381),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '${group['avgRating']}',
                          style: const TextStyle(
                            fontSize: 12,
                            color: Color(0xFF637381),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

import 'package:a2sv_hub/core/presentation/widgets/common_app_bar.dart';
import 'package:a2sv_hub/core/presentation/widgets/sidemenu.dart';
import 'package:a2sv_hub/features/contests/presentation/widgets/contest_card.dart';
import 'package:a2sv_hub/features/contests/presentation/widgets/contest_progress_card.dart';
import 'package:a2sv_hub/features/contests/presentation/widgets/notification_modal.dart';
import 'package:a2sv_hub/features/contests/presentation/widgets/profile_modal.dart';
import 'package:a2sv_hub/features/presentation/widgets/consistency_grid.dart';
import 'package:flutter/material.dart';
import '../widgets/activity_grid.dart';
import '../widgets/contest_progress_chart.dart';
import '../widgets/problem_card.dart';
import '../widgets/profile_header.dart';
import '../widgets/profile_stat.dart';
import '../widgets/profile_tab_bar.dart';

// Model class for problems
class Problem {
  final String id;
  final String title;
  final String category;
  final String difficulty;
  final bool isCompleted;

  Problem({
    required this.id,
    required this.title,
    required this.category,
    required this.difficulty,
    this.isCompleted = false,
  });
}

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
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

  // Example data
  final Map<String, List<bool>> _activityData = {
    'Mon': [false, true, false, false, false, false, false],
    'Tue': [false, true, false, false, false, false, false],
    'Wed': [false, false, false, false, false, false, false],
    'Thu': [false, false, false, false, false, false, false],
    'Fri': [false, false, false, false, false, false, false],
  };

  final Map<DateTime, bool> _attendanceData = {
    DateTime(2023, 1, 5): true,
    DateTime(2023, 1, 10): true,
    DateTime(2023, 2, 3): true,
    DateTime(2023, 2, 7): true,
    DateTime(2023, 2, 15): true,
    DateTime(2023, 2, 22): true,
    DateTime(2023, 3, 1): true,
    DateTime(2023, 3, 8): true,
    DateTime(2023, 3, 15): true,
    DateTime(2023, 3, 22): true,
  };

  final List<ContestProgressPoint> _contestProgressData = [
    ContestProgressPoint(date: DateTime(2023, 1, 1), value: 130),
    ContestProgressPoint(date: DateTime(2023, 1, 15), value: 140),
    ContestProgressPoint(date: DateTime(2023, 2, 1), value: 120),
    ContestProgressPoint(date: DateTime(2023, 2, 15), value: 100),
    ContestProgressPoint(date: DateTime(2023, 3, 1), value: 110),
    ContestProgressPoint(
        date: DateTime(2023, 3, 15), value: 130, isHighlighted: true),
    ContestProgressPoint(date: DateTime(2023, 4, 1), value: 150),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(
        backgroundColor: Colors.white,
        child: SideMenu(),
      ),
      backgroundColor: Colors.white,
      appBar: const CommonAppBar(title: 'Profile'),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Profile header with user info
          const ProfileHeader(
            name: 'Amy Santiago Watson',
            role: 'Student',
            roleTag: 'A2SV',
            avatarUrl: 'assets/images/profile.png',
          ),

          // Tab navigation
          ProfileTabBar(
            tabs: const ['Profile', 'Problems', 'Contests'],
            selectedIndex: _selectedTabIndex,
            onTabSelected: (index) {
              setState(() {
                _selectedTabIndex = index;
              });
            },
          ),

          // Tab content
          Expanded(
            child: _buildTabContent(),
          ),
        ],
      ),
    );
  }

  Widget _buildTabContent() {
    switch (_selectedTabIndex) {
      case 0:
        return _buildProfileTab();
      case 1:
        return _buildProblemsTab();
      case 2:
        return _buildContestsTab();
      default:
        return _buildProfileTab();
    }
  }

  Widget _buildProfileTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Stats row
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ProfileStat(
                label: 'Problems',
                value: '1,299',
              ),
              ProfileStat(
                label: 'Attendance',
                value: '312',
              ),
            ],
          ),

          const SizedBox(height: 24.0),

          // Consistency
          ConsistencyGrid(
            activityData: _activityData,
            year: 2023,
            month: 5,
          ),

          const SizedBox(height: 24.0),

          // Attendance
          ActivityGrid(
            title: 'Attendance',
            activityData: _attendanceData,
            count: 312,
            isAttendance: true,
            activeColor: Colors.green,
          ),

          const SizedBox(height: 24.0),

          // Badge section
          const Text(
            'Rank',
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Center(
                    child: Image.asset(
                      'assets/images/badge.png',
                      width: 150.0,
                      height: 180.0,
                      fit: BoxFit.contain,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  const Text(
                    'Gold',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Master Strategist',
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
            ],
          ),

          const SizedBox(height: 24.0),

          // Links section
          const Text(
            'Links',
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16.0),
          _buildProfileLink('GitHub', Icons.link),
          _buildProfileLink('LeetCode', Icons.code),
          _buildProfileLink('Codeforces', Icons.bar_chart),
          _buildProfileLink('HackerRank', Icons.history_edu),
        ],
      ),
    );
  }

  Widget _buildProblemsTab() {
    final List<Problem> problems = [
      Problem(
        id: '1',
        title: 'F - Ilya and Queries',
        category: 'Contest',
        difficulty: 'Hard',
        isCompleted: true,
      ),
      Problem(
        id: '2',
        title: '2115. Find all possible recipes from given suppliers',
        category: 'Topological Sort',
        difficulty: 'Medium',
        isCompleted: true,
      ),
      Problem(
        id: '3',
        title: 'Valid Parenthesis',
        category: 'Stack',
        difficulty: 'Easy',
        isCompleted: true,
      ),
      Problem(
        id: '4',
        title: 'Merge Two Sorted Lists',
        category: 'Linked List',
        difficulty: 'Easy',
        isCompleted: false,
      ),
      Problem(
        id: '5',
        title: 'Minimum Path Sum',
        category: 'Dynamic Programming',
        difficulty: 'Medium',
        isCompleted: false,
      ),
    ];

    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: problems.length,
      itemBuilder: (context, index) {
        final problem = problems[index];
        return ProblemCard(
          title: problem.title,
          category: problem.category,
          difficulty: problem.difficulty,
          isCompleted: problem.isCompleted,
          onTap: () {},
          onToggleComplete: () {},
          onOpenDetails: () {},
        );
      },
    );
  }

  Widget _buildContestsTab() {
    return Stack(
      children: [
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ContestHeader(
                //   onNotificationTap: toggleNotifications,
                //   onProfileTap: toggleProfileMenu,
                // ),
                // const UserInfoCard(),
                const ContestProgressCard(),
                const SizedBox(height: 29),
                SizedBox(
                  height: 500, // Constrain the height of the ListView
                  child: ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 5,
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 30),
                    itemBuilder: (context, index) {
                      return SizedBox(
                        height: 139,
                        child: ContestCard(
                          title: index % 2 == 0
                              ? '133. A2SV Ghana G6 - Round #5'
                              : '132. A2SV Remote Contest #8',
                          subtitle: index % 2 == 0
                              ? '6 problems . 14h ago'
                              : '6 problems . 14h ago',
                        ),
                      );
                    },
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
    );
  }

  Widget _buildProfileLink(String title, IconData icon) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Row(
        children: [
          Icon(
            icon,
            size: 18.0,
            color: Colors.grey.shade700,
          ),
          const SizedBox(width: 12.0),
          Text(
            title,
            style: const TextStyle(
              fontSize: 16.0,
            ),
          ),
        ],
      ),
    );
  }
}

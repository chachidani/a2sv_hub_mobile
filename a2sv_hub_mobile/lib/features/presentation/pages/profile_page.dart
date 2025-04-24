import 'package:a2sv_hub/features/presentation/widgets/consistency_grid.dart';
import 'package:flutter/material.dart';
import '../widgets/activity_grid.dart';
import '../widgets/contest_item.dart';
import '../widgets/contest_progress_chart.dart';
import '../widgets/profile_header.dart';
import '../widgets/profile_stat.dart';
import '../widgets/profile_tab_bar.dart';
import '../widgets/solved_problem_item.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int _selectedTabIndex = 0;

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
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.black87),
          onPressed: () {},
        ),
        actions: [
          const SizedBox(width: 50),
          IconButton(
            icon: const Icon(Icons.search, color: Colors.black87),
            onPressed: () {},
          ),
          const Spacer(),
          Stack(
            alignment: Alignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.notifications_outlined,
                    color: Colors.black87),
                onPressed: () {},
              ),
              Positioned(
                top: 8,
                right: 8,
                child: Container(
                  width: 18,
                  height: 18,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(9),
                  ),
                  child: const Center(
                    child: Text(
                      '3',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(width: 8),
          const CircleAvatar(
            radius: 16,
            backgroundImage: AssetImage('assets/images/profile.png'),
          ),
          const SizedBox(width: 16),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            Text(
              'Profile',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 16),
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
    return ListView(
      children: [
        // Problem items
        SolvedProblemItem(
          title: 'F - Ilya and Queries',
          category: 'Contest',
          difficulty: 'Hard',
          isCompleted: true,
          onTap: () {},
          onEditTap: () {},
        ),
        SolvedProblemItem(
          title: '2115. Find all possible recipes from given suppliers',
          category: 'Topological Sort ...',
          difficulty: 'Medium',
          isCompleted: true,
          onTap: () {},
          onEditTap: () {},
        ),
        SolvedProblemItem(
          title: 'Valid Parenthesis',
          category: 'Stack',
          difficulty: 'Easy',
          isCompleted: true,
          onTap: () {},
          onEditTap: () {},
        ),
        SolvedProblemItem(
          title: 'Merge Two Sorted Lists',
          category: 'Linked List',
          difficulty: 'Easy',
          isCompleted: false,
          onTap: () {},
          onEditTap: () {},
        ),
        SolvedProblemItem(
          title: 'Minimum Path Sum',
          category: 'Dynamic Programming',
          difficulty: 'Medium',
          isCompleted: false,
          onTap: () {},
          onEditTap: () {},
        ),
      ],
    );
  }

  Widget _buildContestsTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          // Contest Progress Chart
          ContestProgressChart(
            title: 'Contest Progress',
            subtitle: 'Coder #481',
            data: _contestProgressData,
          ),

          const SizedBox(height: 24.0),

          // Contest List
          ContestItem(
            title: '133. A2SV Ghana G6 - Round #5',
            date: '14h ago',
            problems: 6,
            onTap: () {},
            onDismiss: () {},
          ),
          ContestItem(
            title: '132. A2SV Remote Contest #8',
            date: '14h ago',
            problems: 6,
            onTap: () {},
            onDismiss: () {},
          ),
          ContestItem(
            title: '131. A2SV Ghana G6 - Round #4',
            date: '70h ago',
            problems: 6,
            onTap: () {},
            onDismiss: () {},
          ),
          ContestItem(
            title: '130. A2SV Ghana G6 - Round #3',
            date: '14h ago',
            problems: 6,
            onTap: () {},
            onDismiss: () {},
          ),
          ContestItem(
            title: '129. A2SV Remote Contest #7',
            date: '36h ago',
            problems: 6,
            onTap: () {},
            onDismiss: () {},
          ),
        ],
      ),
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

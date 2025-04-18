import 'package:flutter/material.dart';
import '../widgets/completion_progress.dart';
import '../widgets/consistency_grid.dart';
import '../widgets/custom_button.dart';
import '../widgets/stats_card.dart';
import '../widgets/welcome_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Example data for consistency grid
  final Map<String, List<bool>> _activityData = {
    'Mon': [false, true, false, false, false, false, false],
    'Tue': [false, true, false, false, false, false, false],
    'Wed': [false, false, false, false, false, false, false],
    'Thu': [false, false, false, false, false, false, false],
    'Fri': [false, false, false, false, false, false, false],
  };

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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Welcome card with illustration
              Center(
                child: WelcomeCard(
                  title: 'Live the moment for the moment',
                  username: 'Amy',
                  onProblemsTap: () {},
                ),
              ),

              const SizedBox(height: 24.0),

              // Stats Cards
              StatsCard(
                title: 'Solutions',
                value: '342',
                icon: Icon(Icons.check_circle_outline,
                    color: Colors.green.shade400, size: 18),
                progressValue: 0.0,
              ),

              StatsCard(
                title: 'Time Spent',
                value: '9,738',
                subtitle: 'mins',
                icon: Icon(Icons.access_time,
                    color: Colors.green.shade400, size: 18),
                progressValue: 0.0,
              ),

              StatsCard(
                title: 'Rating',
                value: '1,290',
                icon: Icon(Icons.star_outline,
                    color: Colors.green.shade400, size: 18),
                progressValue: 0.0,
              ),

              const SizedBox(height: 16.0),

              // Consistency calendar
              ConsistencyGrid(
                activityData: _activityData,
                year: 2023,
                month: 5,
              ),

              const SizedBox(height: 16.0),

              // Personal Completion
              CompletionProgress(
                title: 'Personal Completion',
                details:
                    '225 Exercises | 138 Solved | 61% Completion | 87 Available',
                progressValue: 0.61,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

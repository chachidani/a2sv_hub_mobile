import 'package:a2sv_hub/core/presentation/widgets/common_app_bar.dart';
import 'package:a2sv_hub/core/presentation/widgets/sidemenu.dart';
import 'package:flutter/material.dart';
import '../widgets/completion_progress.dart';
import '../widgets/consistency_grid.dart';
import '../widgets/custom_button.dart';
import '../widgets/stats_card.dart';
import '../widgets/welcome_card.dart';
import 'problem_page.dart';
import 'package:go_router/go_router.dart';

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
      drawer: const Drawer(
        backgroundColor: Colors.white,
        child: SideMenu(),
      ),
      backgroundColor: Colors.white,
      appBar: const CommonAppBar(),
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
                  onProblemsTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) => const ProblemPage()),
                    );
                  },
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

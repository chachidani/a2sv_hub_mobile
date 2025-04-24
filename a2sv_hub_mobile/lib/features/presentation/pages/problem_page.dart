import 'package:a2sv_hub/core/presentation/widgets/common_app_bar.dart';
import 'package:a2sv_hub/core/presentation/widgets/sidemenu.dart';
import 'package:flutter/material.dart';
import '../widgets/filter_button.dart';
import '../widgets/problem_card.dart';
import '../widgets/problem_category.dart';

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

class ProblemPage extends StatefulWidget {
  const ProblemPage({Key? key}) : super(key: key);

  @override
  State<ProblemPage> createState() => _ProblemPageState();
}

class _ProblemPageState extends State<ProblemPage> {
  String _selectedCategory = 'All';

  // Example problems data
  final List<Problem> _problems = [
    Problem(
      id: '1',
      title: 'F - Ilya and Queries',
      category: 'Contest',
      difficulty: 'Hard',
      isCompleted: true,
    ),
    Problem(
      id: '2',
      title: '2115. Find all possible recipes from given ...',
      category: 'Topological Sort ...',
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
      title: 'F - Ilya and Queries',
      category: 'Contest',
      difficulty: 'Hard',
      isCompleted: true,
    ),
  ];

  List<Problem> get filteredProblems {
    if (_selectedCategory == 'All') {
      return _problems;
    }
    return _problems.where((p) => p.category == _selectedCategory).toList();
  }

  void _toggleProblemCompletion(String id) {
    setState(() {
      final index = _problems.indexWhere((p) => p.id == id);
      if (index != -1) {
        // This would update the actual problem object if we had a mutable state
        // For demonstration, we're not actually changing the state
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<String> categories = [
      'All',
      'Contest',
      'Topological Sort',
      'Stack',
    ];

    return Scaffold(
      drawer: const Drawer(
        backgroundColor: Colors.white,
        child: SideMenu(),
      ),
      backgroundColor: Colors.white,
      appBar: const CommonAppBar(title: 'Problems'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Categories list
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: categories
                    .map(
                      (category) => Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: ProblemCategory(
                          title: category,
                          isSelected: _selectedCategory == category,
                          onTap: () {
                            setState(() {
                              _selectedCategory = category;
                            });
                          },
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),

            const SizedBox(height: 16.0),

            // Filter button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: FilterButton(
                onPressed: () {
                  // Show filter dialog
                },
                filterCount: null,
              ),
            ),

            const SizedBox(height: 16.0),

            // Problems list
            Expanded(
              child: ListView.builder(
                itemCount: filteredProblems.length,
                itemBuilder: (context, index) {
                  final problem = filteredProblems[index];
                  return ProblemCard(
                    title: problem.title,
                    category: problem.category,
                    difficulty: problem.difficulty,
                    isCompleted: problem.isCompleted,
                    onTap: () {
                      // Navigate to problem details
                    },
                    onToggleComplete: () =>
                        _toggleProblemCompletion(problem.id),
                    onOpenDetails: () {
                      // Open problem details in a new page
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

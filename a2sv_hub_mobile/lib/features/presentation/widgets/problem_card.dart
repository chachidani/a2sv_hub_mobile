import 'package:flutter/material.dart';

class ProblemCard extends StatelessWidget {
  final String title;
  final String category;
  final String difficulty;
  final bool isCompleted;
  final VoidCallback onTap;
  final VoidCallback onToggleComplete;
  final VoidCallback onOpenDetails;

  const ProblemCard({
    Key? key,
    required this.title,
    required this.category,
    required this.difficulty,
    required this.isCompleted,
    required this.onTap,
    required this.onToggleComplete,
    required this.onOpenDetails,
  }) : super(key: key);

  Color _getDifficultyColor() {
    switch (difficulty.toLowerCase()) {
      case 'easy':
        return Colors.green;
      case 'medium':
        return Colors.orange;
      case 'hard':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF000000).withOpacity(0.2),
            spreadRadius: 0,
            blurRadius: 2,
          ),
        ],
      ),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(8.0),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    
                    // Problem title and details
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0,
                            ),
                          ),
                          const SizedBox(height: 4.0),
                          Text(
                            category,
                            style: TextStyle(
                              color: Colors.grey.shade700,
                              fontSize: 14.0,
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Completion status indicator
                    GestureDetector(
                      onTap: onToggleComplete,
                      child: Container(
                        margin: const EdgeInsets.only(right: 8.0, top: 2.0),
                        child: Icon(
                          isCompleted
                              ? Icons.check_circle
                              : Icons.circle_outlined,
                          color: isCompleted ? Colors.blue : Colors.grey,
                          size: 20.0,
                        ),
                      ),
                    ),
                    // Edit button
                    IconButton(
                      icon: const Icon(Icons.edit_note, color: Colors.grey),
                      onPressed: onOpenDetails,
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                    ),
                  ],
                ),
                const SizedBox(height: 8.0),
                // Difficulty indicator
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 4.0),
                    decoration: BoxDecoration(
                      color: _getDifficultyColor().withOpacity(0.2),
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    child: Text(
                      difficulty,
                      style: TextStyle(
                        color: _getDifficultyColor(),
                        fontSize: 12.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      
    );
  }
}

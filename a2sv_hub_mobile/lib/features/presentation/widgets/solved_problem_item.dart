import 'package:flutter/material.dart';

class SolvedProblemItem extends StatelessWidget {
  final String title;
  final String? category;
  final String? difficulty;
  final bool isCompleted;
  final VoidCallback onTap;
  final VoidCallback onEditTap;

  const SolvedProblemItem({
    Key? key,
    required this.title,
    this.category,
    this.difficulty,
    this.isCompleted = false,
    required this.onTap,
    required this.onEditTap,
  }) : super(key: key);

  Color _getDifficultyColor() {
    switch (difficulty?.toLowerCase()) {
      case 'hard':
        return Colors.red.shade400;
      case 'medium':
        return Colors.orange.shade400;
      case 'easy':
        return Colors.green.shade400;
      default:
        return Colors.grey.shade400;
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Colors.grey.shade200, width: 1.0),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Completion status
            Padding(
              padding: const EdgeInsets.only(top: 3.0, right: 12.0),
              child: isCompleted
                  ? const Icon(
                      Icons.check_circle,
                      color: Colors.blue,
                      size: 20.0,
                    )
                  : Icon(
                      Icons.circle_outlined,
                      color: Colors.grey.shade400,
                      size: 20.0,
                    ),
            ),

            // Problem details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16.0,
                    ),
                  ),
                  if (category != null) ...[
                    const SizedBox(height: 4.0),
                    Text(
                      category!,
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 14.0,
                      ),
                    ),
                  ],
                ],
              ),
            ),

            // Difficulty and edit button
            Row(
              children: [
                if (difficulty != null)
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 4.0),
                    decoration: BoxDecoration(
                      color: _getDifficultyColor().withOpacity(0.2),
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    child: Text(
                      difficulty!,
                      style: TextStyle(
                        color: _getDifficultyColor(),
                        fontSize: 12.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                IconButton(
                  icon: const Icon(Icons.edit_outlined, color: Colors.grey),
                  onPressed: onEditTap,
                  constraints: const BoxConstraints(),
                  padding: const EdgeInsets.only(left: 8.0),
                  iconSize: 20.0,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

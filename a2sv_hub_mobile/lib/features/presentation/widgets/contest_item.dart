import 'package:flutter/material.dart';

class ContestItem extends StatelessWidget {
  final String title;
  final String date;
  final int problems;
  final VoidCallback onTap;
  final VoidCallback onDismiss;

  const ContestItem({
    Key? key,
    required this.title,
    required this.date,
    required this.problems,
    required this.onTap,
    required this.onDismiss,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(title),
      background: Container(
        color: Colors.red.shade100,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 16.0),
        child: const Icon(Icons.delete, color: Colors.red),
      ),
      direction: DismissDirection.endToStart,
      onDismissed: (_) => onDismiss(),
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Colors.grey.shade200,
                width: 1.0,
              ),
            ),
          ),
          child: Row(
            children: [
              // Contest info
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 15.0,
                      ),
                    ),
                    const SizedBox(height: 4.0),
                    Text(
                      '$problems problems · $date',
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 13.0,
                      ),
                    ),
                  ],
                ),
              ),

              // Remove and edit buttons
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.close, color: Colors.grey),
                    onPressed: onDismiss,
                    constraints: const BoxConstraints(),
                    padding: const EdgeInsets.all(8.0),
                    iconSize: 18.0,
                  ),
                  IconButton(
                    icon: const Icon(Icons.edit_outlined, color: Colors.grey),
                    onPressed: onTap,
                    constraints: const BoxConstraints(),
                    padding: const EdgeInsets.all(8.0),
                    iconSize: 18.0,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

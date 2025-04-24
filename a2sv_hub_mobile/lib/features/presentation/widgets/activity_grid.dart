import 'package:flutter/material.dart';

class ActivityGrid extends StatelessWidget {
  final String title;
  final Map<DateTime, bool> activityData;
  final bool isAttendance;
  final Color activeColor;
  final Color inactiveColor;
  final int count;

  const ActivityGrid({
    Key? key,
    required this.title,
    required this.activityData,
    this.isAttendance = false,
    this.activeColor = const Color(0xFF2065D1),
    this.inactiveColor = const Color(0xFFEEEEEE),
    required this.count,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Calculate grid dimensions - attendance has more days
    final int columns = isAttendance ? 20 : 7;
    final int rows = isAttendance ? 7 : 5;

    // Generate list of dates for the labels
    final List<String> days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    final List<String> months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec'
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title and count
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Text(
                count.toString(),
                style: TextStyle(
                  color: Colors.grey.shade700,
                  fontSize: 14.0,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12.0),

        // Calendar grid
        Column(
          children: [
            // Days row (only for consistency)
            if (!isAttendance)
              Row(
                children: [
                  const SizedBox(width: 20.0), // For month labels
                  ...days.map((day) => Expanded(
                        child: Center(
                          child: Text(
                            day,
                            style: TextStyle(
                              fontSize: 10.0,
                              color: Colors.grey.shade600,
                            ),
                          ),
                        ),
                      )),
                ],
              ),

            const SizedBox(height: 4.0),

            // Grid cells
            for (int row = 0; row < rows; row++)
              Row(
                children: [
                  // Row label (month for attendance)
                  if (isAttendance && row % 2 == 0)
                    SizedBox(
                      width: 20.0,
                      child: Text(
                        months[row ~/ 2 % 12],
                        style: TextStyle(
                          fontSize: 10.0,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    )
                  else
                    const SizedBox(width: 20.0),

                  // Cells
                  ...List.generate(
                    columns,
                    (col) {
                      // Determine if cell is active (sample logic - replace with actual data lookup)
                      final isActive = activityData.entries
                              .where((entry) =>
                                  entry.key.day == col + 1 &&
                                  entry.key.month == row + 1)
                              .map((entry) => entry.value)
                              .firstOrNull ??
                          false;

                      return Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(1.0),
                          child: !isAttendance
                              // For consistency grid, use fixed size of 19x19
                              ? SizedBox(
                                  width: 19.0,
                                  height: 19.0,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: isActive
                                          ? activeColor
                                          : inactiveColor,
                                      borderRadius: BorderRadius.circular(2.0),
                                    ),
                                  ),
                                )
                              // For attendance grid, maintain aspect ratio
                              : AspectRatio(
                                  aspectRatio: 1.0,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: isActive
                                          ? activeColor
                                          : inactiveColor,
                                      borderRadius: BorderRadius.circular(2.0),
                                    ),
                                  ),
                                ),
                        ),
                      );
                    },
                  ),
                ],
              ),
          ],
        ),
      ],
    );
  }
}

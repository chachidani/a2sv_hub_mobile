import 'package:flutter/material.dart';

class ConsistencyGrid extends StatelessWidget {
  final Map<String, List<bool>> activityData;
  final int year;
  final int month;

  const ConsistencyGrid({
    Key? key,
    required this.activityData,
    required this.year,
    required this.month,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> weekDays = [
      'Mon',
      'Tue',
      'Wed',
      'Thu',
      'Fri',
      'Sat',
      'Sun'
    ];

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Month and year selector
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Consistency',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.0),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: Row(
                  children: [
                    Text(
                      '$year',
                      style: const TextStyle(fontSize: 14.0),
                    ),
                    const Icon(Icons.arrow_drop_down, size: 16.0),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12.0),

          // Day labels
          Row(
            children: [
              const SizedBox(width: 30.0), // Space for the day label column
              ...weekDays.map((day) => Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 2.0),
                      child: Text(
                        day,
                        style: const TextStyle(
                          fontSize: 12.0,
                          color: Colors.grey,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )),
            ],
          ),

          const SizedBox(height: 8.0),

          // Grid
          for (var dayKey in activityData.keys)
            Row(
              children: [
                SizedBox(
                  width: 30.0,
                  child: Text(
                    dayKey,
                    style: const TextStyle(
                      fontSize: 12.0,
                      color: Colors.grey,
                    ),
                  ),
                ),
                ...List.generate(
                  activityData[dayKey]!.length,
                  (index) => Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Container(
                        height: 16.0,
                        width: 19.0,
                        decoration: BoxDecoration(
                          color: activityData[dayKey]![index]
                              ? const Color(0xFF2065D1)
                              : Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(2.0),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}

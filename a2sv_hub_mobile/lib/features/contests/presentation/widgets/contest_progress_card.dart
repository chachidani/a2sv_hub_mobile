import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class ContestProgressCard extends StatelessWidget {
  const ContestProgressCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 550,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        vertical: 19,
        horizontal: 10,
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(25, 13, 4, 92),
            blurRadius: 10,
          ),
        ],
      ),
      child: Column(
        children: [
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Contest Progress',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              padding: const EdgeInsets.symmetric(
                vertical: 2,
                horizontal: 4,
              ),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 255, 255, 255),
                boxShadow: [
                  BoxShadow(
                    color:
                        const Color.fromARGB(255, 13, 4, 92).withOpacity(0.2),
                    blurRadius: 10,
                  ),
                ],
              ),
              child: const Text(
                'Highest 1400',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF777777),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: Stack(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: [0.4, 0.4],
                      colors: [
                        Color(0xFFFFD1DC),
                        Color.fromARGB(255, 245, 226, 192),
                      ],
                    ),
                  ),
                ),
                LineChart(
                  LineChartData(
                    minY: 1040,
                    maxY: 1440,
                    gridData: FlGridData(
                      show: true,
                      drawVerticalLine: false,
                      getDrawingHorizontalLine: (value) {
                        return FlLine(
                          color: Colors.grey.withOpacity(0.3),
                          strokeWidth: 1,
                          dashArray: [5, 5],
                        );
                      },
                    ),
                    titlesData: FlTitlesData(
                      leftTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          reservedSize: 40,
                          getTitlesWidget: (value, meta) {
                            return Text(
                              value.toInt().toString(),
                              style: const TextStyle(
                                  fontSize: 10, color: Colors.grey),
                            );
                          },
                        ),
                      ),
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          getTitlesWidget: (value, meta) {
                            final labels = [
                              'Start',
                              'Contest #8 (-90)',
                              'Contest #11 (0)',
                              'Contest #14 (-9)',
                              'Contest #17 (0)',
                              'Contest #20 (0)',
                              'Contest #23 (0)',
                              'Contest #27 (0)',
                              'Round #41 (+72)',
                            ];
                            if (value.toInt() >= 0 &&
                                value.toInt() < labels.length) {
                              return Transform.rotate(
                                angle: -0.5,
                                child: Text(
                                  labels[value.toInt()],
                                  style: const TextStyle(
                                      fontSize: 10, color: Colors.grey),
                                ),
                              );
                            } else {
                              return const SizedBox();
                            }
                          },
                          reservedSize: 50,
                        ),
                      ),
                      topTitles:
                          AxisTitles(sideTitles: SideTitles(showTitles: false)),
                      rightTitles:
                          AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    ),
                    borderData: FlBorderData(
                      show: false,
                    ),
                    lineBarsData: [
                      LineChartBarData(
                        spots: [
                          FlSpot(0, 1400),
                          FlSpot(1, 1310),
                          FlSpot(2, 1280),
                          FlSpot(3, 1260),
                          FlSpot(4, 1130),
                          FlSpot(5, 1120),
                          FlSpot(6, 1200),
                          FlSpot(7, 1200),
                          FlSpot(8, 1280),
                        ],
                        isCurved: false,
                        color: Colors.grey.shade700,
                        barWidth: 2,
                        isStrokeCapRound: true,
                        dotData: FlDotData(
                          show: true,
                          getDotPainter: (spot, percent, barData, index) =>
                              FlDotCirclePainter(
                            radius: 4,
                            color: Colors.grey.shade700,
                            strokeWidth: 0,
                          ),
                        ),
                        belowBarData: BarAreaData(show: false), // <- important
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          _buildLegend(),
        ],
      ),
    );
  }

  static Widget _buildLegend() {
    const items = [
      {'color': Color(0x806495ED), 'label': 'Ninja'},
      {'color': Color(0x808A2BE2), 'label': 'Wizard'},
      {'color': Color(0x8090CC90), 'label': 'Pro'},
      {'color': Color(0x80FF0000), 'label': 'Elite'},
    ];
    const items2 = [
      {'color': Color(0xADD8E680), 'label': 'Coder'},
      {'color': Color(0x80FFA07A), 'label': 'Solver'},
      {'color': Color(0x80CD5C5C), 'label': 'Strategist'},
      {'color': Color(0x8087CEEB), 'label': 'Knight'},
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: items2.map((item) {
              return Row(
                children: [
                  Container(
                    width: 10,
                    height: 5,
                    decoration: BoxDecoration(
                      color: item['color'] as Color,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    item['label'] as String,
                    style: const TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF212B36),
                    ),
                  ),
                ],
              );
            }).toList(),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: items.map((item) {
              return Row(
                children: [
                  Container(
                    width: 10,
                    height: 5,
                    decoration: BoxDecoration(
                      color: item['color'] as Color,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    item['label'] as String,
                    style: const TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF212B36),
                    ),
                  ),
                ],
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

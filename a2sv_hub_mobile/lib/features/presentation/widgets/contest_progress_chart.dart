import 'package:flutter/material.dart';

class ContestProgressPoint {
  final DateTime date;
  final int value;
  final bool isHighlighted;

  ContestProgressPoint({
    required this.date,
    required this.value,
    this.isHighlighted = false,
  });
}

class ContestProgressChart extends StatelessWidget {
  final List<ContestProgressPoint> data;
  final String title;
  final String subtitle;
  final double maxValue;
  final double minValue;

  const ContestProgressChart({
    Key? key,
    required this.data,
    required this.title,
    required this.subtitle,
    this.maxValue = 200,
    this.minValue = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 10.0,
                vertical: 4.0,
              ),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Text(
                subtitle,
                style: TextStyle(
                  color: Colors.grey.shade700,
                  fontSize: 12.0,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16.0),

        // Chart
        Container(
          height: 200.0,
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          color: Colors.red.shade50,
          child: CustomPaint(
            size: const Size(double.infinity, 200.0),
            painter: _ChartPainter(
              data: data,
              maxValue: maxValue,
              minValue: minValue,
            ),
          ),
        ),

        const SizedBox(height: 8.0),

        // X-axis labels (dates)
        SizedBox(
          height: 24.0,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: data.length,
            itemBuilder: (context, index) {
              final date = data[index].date;
              return SizedBox(
                width: 60.0,
                child: Text(
                  '${date.month}/${date.day}',
                  style: TextStyle(
                    fontSize: 10.0,
                    color: Colors.grey.shade600,
                  ),
                  textAlign: TextAlign.center,
                ),
              );
            },
          ),
        ),

        const SizedBox(height: 16.0),

        // Legend
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildLegendItem('Coder', Colors.blue),
            _buildLegendItem('Solver', Colors.amber),
            _buildLegendItem('Strategist', Colors.green),
            _buildLegendItem('Knight', Colors.purple),
          ],
        ),
      ],
    );
  }

  Widget _buildLegendItem(String text, Color color) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 10.0,
          height: 10.0,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 4.0),
        Text(
          text,
          style: TextStyle(
            fontSize: 12.0,
            color: Colors.grey.shade700,
          ),
        ),
      ],
    );
  }
}

class _ChartPainter extends CustomPainter {
  final List<ContestProgressPoint> data;
  final double maxValue;
  final double minValue;

  _ChartPainter({
    required this.data,
    required this.maxValue,
    required this.minValue,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint linePaint = Paint()
      ..color = Colors.red.shade400
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;

    final Paint dashedLinePaint = Paint()
      ..color = Colors.grey.shade400
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;

    final Paint dotPaint = Paint()
      ..color = Colors.red.shade400
      ..style = PaintingStyle.fill;

    final Paint highlightPaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;

    // Draw horizontal grid lines
    final int divisions = 5;
    final double step = size.height / divisions;

    for (int i = 0; i <= divisions; i++) {
      final double y = i * step;
      final double dashWidth = 5.0;
      double startX = 0;

      while (startX < size.width) {
        canvas.drawLine(
          Offset(startX, y),
          Offset(startX + dashWidth, y),
          dashedLinePaint,
        );
        startX += dashWidth * 2;
      }
    }

    // Draw the line chart
    if (data.isNotEmpty) {
      final double xStep = size.width / (data.length - 1);
      final double valueRange = maxValue - minValue;

      final Path path = Path();
      path.moveTo(
        0,
        size.height - ((data[0].value - minValue) / valueRange * size.height),
      );

      for (int i = 1; i < data.length; i++) {
        final double x = i * xStep;
        final double y = size.height -
            ((data[i].value - minValue) / valueRange * size.height);
        path.lineTo(x, y);
      }

      canvas.drawPath(path, linePaint);

      // Draw dots for each data point
      for (int i = 0; i < data.length; i++) {
        final double x = i * xStep;
        final double y = size.height -
            ((data[i].value - minValue) / valueRange * size.height);

        canvas.drawCircle(Offset(x, y), 4.0, dotPaint);

        if (data[i].isHighlighted) {
          canvas.drawCircle(Offset(x, y), 6.0, highlightPaint);
        }
      }
    }
  }

  @override
  bool shouldRepaint(covariant _ChartPainter oldDelegate) {
    return oldDelegate.data != data ||
        oldDelegate.maxValue != maxValue ||
        oldDelegate.minValue != minValue;
  }
}

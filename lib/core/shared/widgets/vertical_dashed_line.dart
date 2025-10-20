import 'package:flutter/material.dart';

class VerticalDashedLine extends StatelessWidget {
  final Color color;
  final double dashLength;
  final double dashGap;

  const VerticalDashedLine({
    super.key,
    required this.color,
    this.dashLength = 3.0,
    this.dashGap = 3.0,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(1, double.infinity),
      painter: _DashedLinePainter(
        color: color,
        dashLength: dashLength,
        dashGap: dashGap,
      ),
    );
  }
}

class _DashedLinePainter extends CustomPainter {
  final Color color;
  final double dashLength;
  final double dashGap;

  _DashedLinePainter({
    required this.color,
    required this.dashLength,
    required this.dashGap,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 1.5
      ..style = PaintingStyle.stroke;

    final double startX = size.width / 2;
    double startY = 0;

    while (startY < size.height) {
      canvas.drawLine(
        Offset(startX, startY),
        Offset(startX, startY + dashLength),
        paint,
      );
      startY += dashLength + dashGap;
    }
  }

  @override
  bool shouldRepaint(_DashedLinePainter oldDelegate) =>
      oldDelegate.color != color ||
      oldDelegate.dashLength != dashLength ||
      oldDelegate.dashGap != dashGap;
}

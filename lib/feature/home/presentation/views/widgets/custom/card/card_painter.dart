import 'package:flutter/material.dart';

class CardPainter extends CustomPainter {
  final Color fillColor;
  Color? borderColor;
  final double tabWidth;
  final double tabHeight;
  CardPainter({
    super.repaint,
    required this.fillColor,
    this.borderColor,
    required this.tabWidth,
    required this.tabHeight,
  });
  @override
  void paint(Canvas canvas, Size size) {
    const double radius = 15.0; // card big corners
    const double tabRadius = 15.0; // small tab corners

    final Paint paint = Paint()
      ..color = fillColor
      ..style = PaintingStyle.fill;

    final Paint borderPaint = Paint()
      ..color = borderColor ?? Colors.transparent
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    Path path = Path();

    double tabStartX = size.width - tabWidth - 22;
    double tabEndX = size.width - 22;

    // Start at top-left of the tab
    path.moveTo(tabStartX + tabRadius, 0);

    // Top side of the tab
    path.lineTo(tabEndX - tabRadius, 0);

    // Top-right arc of the tab
    path.arcToPoint(
      Offset(tabEndX, tabRadius),
      radius: const Radius.circular(tabRadius),
      clockwise: true,
    );

    // Right side of the tab
    path.lineTo(tabEndX, tabHeight);

    // Connect to main card top-right
    path.lineTo(size.width - radius, tabHeight);

    // Main card top-right corner
    path.arcToPoint(
      Offset(size.width, tabHeight + radius),
      radius: const Radius.circular(radius),
      clockwise: true,
    );

    // Right side
    path.lineTo(size.width, size.height - radius);

    // Bottom-right corner
    path.arcToPoint(
      Offset(size.width - radius, size.height),
      radius: const Radius.circular(radius),
      clockwise: true,
    );

    // Bottom side
    path.lineTo(radius, size.height);

    // Bottom-left corner
    path.arcToPoint(
      Offset(0, size.height - radius),
      radius: const Radius.circular(radius),
      clockwise: true,
    );

    // Left side
    path.lineTo(0, tabHeight + radius);

    // Top-left corner of main card
    path.arcToPoint(
       Offset(radius, tabHeight),
      radius: const Radius.circular(radius),
      clockwise: true,
    );

    // Left side of the tab bottom
    path.lineTo(tabStartX, tabHeight);

    // Left side of the tab
    path.lineTo(tabStartX, tabRadius);

    // Top-left arc of the tab
    path.arcToPoint(
      Offset(tabStartX + tabRadius, 0),
      radius: const Radius.circular(tabRadius),
      clockwise: true,
    );

    path.close();

    // Fill and draw border
    canvas.drawPath(path, paint);
    if (borderColor != null) {
      canvas.drawPath(path, borderPaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

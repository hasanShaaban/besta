import 'package:besta/feature/home/presentation/views/widgets/custom/card/card_painter.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    super.key,
    required this.width,
    required this.height,
    required this.fillColor,
    this.borderColor,
    required this.child,
    required this.date,
  });
  final double width;
  final double height;
  final Color fillColor;
  final Color? borderColor;
  final Widget child;
  final Widget date;
  final double tabWidth = 100.0;
  final double tabHeight = 15.0;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomPaint(
          painter: CardPainter(
              fillColor: fillColor,
              borderColor: borderColor,
              tabWidth: tabWidth,
              tabHeight: tabHeight),
          child: SizedBox(
            width: width,
            height: height,
            child: child,
          ),
        ),
        Positioned(
          right: 22,
          child: SizedBox(
          
            width: tabWidth,
            height: tabHeight * 2,
            child: Center(
              child: date
            ),
          ),
        ),
      ],
    );
  }
}

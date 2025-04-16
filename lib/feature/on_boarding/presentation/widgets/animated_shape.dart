import 'package:besta/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AnimatedShape extends StatelessWidget {
  const AnimatedShape({
    super.key,
    required List<Map<String, double>> positions,
    required int currentPage,
    required List<double> rotationAngles,
    required List<Color> colors,
  }) : _positions = positions, _currentPage = currentPage, _rotationAngles = rotationAngles, _colors = colors;

  final List<Map<String, double>> _positions;
  final int _currentPage;
  final List<double> _rotationAngles;
  final List<Color> _colors;

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration:const Duration(milliseconds: 500),
      top: _positions[_currentPage]['top'],
      left: _positions[_currentPage]['left'],
      child: AnimatedRotation(
        duration:const Duration(milliseconds: 500),
        turns: _rotationAngles[_currentPage] / 360,
        child: SvgPicture.asset(
          Assets.imagesPath,
          color: _colors[_currentPage],
          allowDrawingOutsideViewBox: true,
        ),
      ),
    );
  }
}
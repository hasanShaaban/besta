import 'package:besta/core/utils/constants.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

class OnBoardingDotsIndecator extends StatelessWidget {
  const OnBoardingDotsIndecator({
    super.key,
    required int currentPage,
  }) : _currentPage = currentPage;

  final int _currentPage;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 400,
      right: 0,
      left: 0,
      child: DotsIndicator(
        dotsCount: 3,
        position: _currentPage.toDouble(),
        decorator: DotsDecorator(
          color: AppColors.primaryColor,
          activeColor: AppColors.primaryColor,
          size: const Size.square(10.0),
          activeSize: const Size(18.0, 10.0),
          activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0)),
        ),
      ),
    );
  }
}
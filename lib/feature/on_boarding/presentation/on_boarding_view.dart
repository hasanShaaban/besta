import 'package:besta/feature/on_boarding/presentation/widgets/on_boarding_view_body.dart';
import 'package:flutter/material.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});
  static const routeName = 'onBoarding';
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: OnBoardingViewBody(),
      ),
    );
  }
}

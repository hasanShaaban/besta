import 'package:besta/core/utils/app_text_style.dart';
import 'package:besta/core/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({super.key, required this.text, required this.image});
  final String text;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 61),
        LottieBuilder.asset(image, width: 250, height: 250,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22),
          child: Text(
            textAlign: TextAlign.center,
            text,
            style: AppTextStyle.cairoSemiBold18
                .copyWith(color: AppColors.primaryColor),
          ),
        )
      ],
    );
  }
}

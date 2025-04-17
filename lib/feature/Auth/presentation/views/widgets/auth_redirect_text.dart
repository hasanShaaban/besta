import 'package:besta/core/utils/app_text_style.dart';
import 'package:besta/core/utils/constants.dart';
import 'package:flutter/material.dart';

class AuthRedirectText extends StatelessWidget {
  const AuthRedirectText({
    super.key, required this.staitcText, required this.redirectorText, required this.onTap,
  });
  final String staitcText;
  final String redirectorText;
  final GestureTapCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          staitcText,
          style: AppTextStyle.cairoRegular14
              .copyWith(color: AppColors.primaryColor),
        ),
        GestureDetector(
          onTap: onTap,
          child: Text(
            redirectorText,
            style: AppTextStyle.cairoRegular14
                .copyWith(color: AppColors.thirdColor),
          ),
        )
      ],
    );
  }
}
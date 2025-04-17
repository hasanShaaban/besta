import 'package:besta/core/utils/app_text_style.dart';
import 'package:besta/core/utils/assets.dart';
import 'package:besta/core/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomAuthButton extends StatelessWidget {
  const CustomAuthButton({super.key, required this.onPressed});
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: 0,
      onPressed: onPressed,
      color: AppColors.primaryColor,
      height: 53,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(Assets.iconsArrowRightToBracket),
          const SizedBox(width: 7),
          Text(
            'تسجيل الدخول',
            style: AppTextStyle.cairoBold18
                .copyWith(color: AppColors.backgroundColor),
          ),
        ],
      ),
    );
  }
}

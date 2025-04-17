import 'package:besta/core/utils/app_text_style.dart';
import 'package:besta/core/utils/assets.dart';
import 'package:besta/core/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class GoogleButton extends StatelessWidget {
  const GoogleButton({super.key, required this.onPressed});
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 53,
      color: AppColors.backgroundColor,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25),side:const BorderSide(color: AppColors.deviderColor)),
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(Assets.iconsGoogleIcon, width: 24,height: 24,),
          const SizedBox(width: 13),
          Text('سجل الدخول باستخدام جوجل', style: AppTextStyle.cairoRegular16.copyWith(color: AppColors.primaryColor),)
        ],
      ),
    );
  }
}

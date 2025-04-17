import 'package:besta/core/utils/app_text_style.dart';
import 'package:besta/core/utils/constants.dart';
import 'package:flutter/material.dart';

class SkipButton extends StatelessWidget {
  const SkipButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
        minimumSize: Size.zero, 
        tapTargetSize: MaterialTapTargetSize.shrinkWrap, 
      ),
      onPressed: () {},
      child: Text(
        'تخط',
        style: AppTextStyle.cairoRegular16.copyWith(
            color: AppColors.deviderColor,
            decoration: TextDecoration.underline,
            decorationColor: AppColors.deviderColor),
      ),
    );
  }
}

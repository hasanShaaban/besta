import 'package:besta/core/utils/app_text_style.dart';
import 'package:besta/core/utils/assets.dart';
import 'package:besta/core/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SetctionsDevider extends StatelessWidget {
  const SetctionsDevider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          Assets.iconsCalendarLines,
        ),
        const SizedBox(width: 4),
        Text(
          'بيانات اليوم :',
          style: AppTextStyle.cairoRegular20
              .copyWith(color: AppColors.primaryColor),
        )
      ],
    );
  }
}

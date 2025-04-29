import 'package:besta/core/utils/app_text_style.dart';
import 'package:besta/core/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SetctionsDevider extends StatelessWidget {
  const SetctionsDevider({
    super.key,
    required this.title,
    required this.icon,
    this.action,
  });

  final String title;
  final String icon;
  final String? action;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          icon,
        ),
        const SizedBox(width: 7),
        Text(
          title,
          style: AppTextStyle.cairoRegular20
              .copyWith(color: AppColors.primaryColor),
        ),
        const Spacer(),
        action != null
            ? TextButton(
                onPressed: () {},
                child: Text(
                  action!,
                  style: AppTextStyle.cairoRegular12.copyWith(
                      color: AppColors.thirdColor,
                      decoration: TextDecoration.underline, decorationColor: AppColors.thirdColor),
                ))
            : const Spacer(),
      ],
    );
  }
}

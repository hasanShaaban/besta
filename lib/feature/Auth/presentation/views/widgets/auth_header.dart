import 'package:besta/core/utils/app_text_style.dart';
import 'package:besta/core/utils/assets.dart';
import 'package:besta/core/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


class AuthHeader extends StatelessWidget {
  const AuthHeader({
    super.key, required this.description, required this.authType,
  });

  final String description;
  final String authType;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 292 / 383,
          child: Text(
            description,
            textAlign: TextAlign.center,
            style: AppTextStyle.cairoBold18
                .copyWith(color: AppColors.primaryColor),
          ),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            SvgPicture.asset(Assets.iconsAccountCircle),
            const SizedBox(width: 10),
            Text(authType, style: AppTextStyle.cairoBold16.copyWith(color: AppColors.secondryColor),)
          ],
        ),
      ],
    );
  }
}

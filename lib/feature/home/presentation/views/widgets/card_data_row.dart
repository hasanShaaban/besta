import 'package:besta/core/utils/app_text_style.dart';
import 'package:besta/core/utils/constants.dart';
import 'package:flutter/material.dart';

class CardDataRow extends StatelessWidget {
  const CardDataRow({
    super.key,
    required this.title,
    required this.amount,
  });
  final String title;
  final String amount;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: AppTextStyle.cairoRegular16
              .copyWith(color: AppColors.primaryColor),
        ),
        const Spacer(),
        Text(
          amount,
          style: AppTextStyle.cairoSemiBold16
              .copyWith(color: AppColors.thirdColor),
        ),
      ],
    );
  }
}

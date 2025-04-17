import 'package:besta/core/utils/app_text_style.dart';
import 'package:besta/core/utils/constants.dart';
import 'package:flutter/material.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: Divider(color: AppColors.deviderColor)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2),
          child: Text(
            'أو',
            style: AppTextStyle.cairoRegular16
                .copyWith(color: AppColors.deviderColor),
          ),
        ),
        const Expanded(child: Divider(color: AppColors.deviderColor)),
      ],
    );
  }
}

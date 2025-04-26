import 'package:besta/core/utils/app_text_style.dart';
import 'package:besta/core/utils/constants.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

class WhiteCardData extends StatelessWidget {
  const WhiteCardData({
    super.key,
    required this.icon,
    required this.title,
    required this.amount,
  });
  final String icon;
  final String title;
  final String amount;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            SvgPicture.asset(icon),
            const SizedBox(width: 6),
            Text(
              title,
              style: AppTextStyle.cairoRegular20
                  .copyWith(color: AppColors.primaryColor),
            )
          ],
        ),
        Text(
          amount,
          style:
              AppTextStyle.cairoRegular24.copyWith(color: AppColors.thirdColor),
        )
      ],
    );
  }
}

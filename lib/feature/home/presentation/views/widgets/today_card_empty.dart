import 'package:besta/core/utils/app_text_style.dart';
import 'package:besta/core/utils/assets.dart';
import 'package:besta/core/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TodayCardEmpty extends StatelessWidget {
  const TodayCardEmpty({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(top: 15, left: 15, right: 15),
      child: SizedBox(
        height: 50,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              'لا توجد بيانات لليوم. \nاضغط لإضافة مصاريفك أو دخلك',
              style: AppTextStyle.cairoRegular16
                  .copyWith(color: AppColors.backgroundColor),
            ),
            const SizedBox(
              height: 75,
              child: VerticalDivider(
                color: AppColors.backgroundColor,
                indent: 13,
                endIndent: 13,
              ),
            ),
            IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                    Assets.iconsArrowUpRightFromSquare))
          ],
        ),
      ),
    );
  }
}

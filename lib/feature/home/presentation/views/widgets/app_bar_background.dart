import 'package:besta/core/utils/app_text_style.dart';
import 'package:besta/core/utils/assets.dart';
import 'package:besta/core/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppBarBackGround extends StatelessWidget {
  const AppBarBackGround({
    super.key,
    required this.appBarHeight,
  });

  final double appBarHeight;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 60),
      height: appBarHeight,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(36),
          bottomRight: Radius.circular(36),
        ),
        gradient: LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          colors: [
            AppColors.fourthColor,
            AppColors.thirdColor,
          ],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 22, right: 22, left: 22),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'الأحد 25\\12\\2025',
                  style: AppTextStyle.cairoSemiBold24
                      .copyWith(color: Colors.white),
                ),
                SvgPicture.asset(Assets.iconsList),
              ],
            ),
            const SizedBox(height: 11),
            Visibility(
              visible: appBarHeight == 180,
              child: AnimatedAlign(
                alignment: appBarHeight == 180
                    ? const Alignment(0, 0)
                    : Alignment(0, appBarHeight / 180),
                duration: const Duration(milliseconds: 300),
                child: AnimatedOpacity(
                  opacity: appBarHeight == 180 ? 1.0 : 0.0,
                  duration: const Duration(milliseconds: 300),
                  child: Row(
                    children: [
                      SvgPicture.asset(Assets.iconsFileInvoiceDollar),
                      const SizedBox(width: 7),
                      Text(
                        'نتائج هذا الاسبوع',
                        style: AppTextStyle.cairoRegular20
                            .copyWith(color: AppColors.primaryColor),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
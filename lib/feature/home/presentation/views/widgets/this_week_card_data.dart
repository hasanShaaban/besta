import 'package:besta/core/utils/app_text_style.dart';
import 'package:besta/core/utils/assets.dart';
import 'package:besta/core/utils/constants.dart';
import 'package:besta/feature/home/presentation/views/widgets/card_data_row.dart';
import 'package:besta/feature/home/presentation/views/widgets/custom/card/custom_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ThisWeekCardData extends StatelessWidget {
  const ThisWeekCardData({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 7, left: 38, right: 1),
      child: CustomCard(
        width: 243,
        height: 203,
        fillColor: AppColors.backgroundColor,
        borderColor: AppColors.primaryColor,
        date: Text(
          'السبت 25-12',
          style: AppTextStyle.cairoSemiBold14
              .copyWith(color: AppColors.primaryColor),
        ),
        child: SizedBox(
          height: 203,
          width: 343,
          child: Padding(
            padding: const EdgeInsets.only(top: 40, right: 30, left: 30),
            child: Column(
              children: [
                const CardDataRow(
                  title: 'الدخل :',
                  amount: '000 100',
                ),
                const CardDataRow(
                  title: 'مصروف للسيارة :',
                  amount: '000 75',
                ),
                const CardDataRow(
                  title: 'وقود :',
                  amount: '000 50',
                ),
                const CardDataRow(
                  title: 'مصاريف اليوم :',
                  amount: '000 150',
                ),
                const Divider(
                  color: AppColors.deviderColor,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'اضغط هنا للتعديل',
                      style: AppTextStyle.cairoRegular16
                          .copyWith(color: AppColors.primaryColor),
                    ),
                    const SizedBox(width: 9),
                    SvgPicture.asset(Assets.iconsEdit)
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}


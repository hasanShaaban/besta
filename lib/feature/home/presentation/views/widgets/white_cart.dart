import 'package:besta/core/utils/assets.dart';
import 'package:besta/core/utils/constants.dart';
import 'package:besta/feature/home/presentation/views/widgets/white_card_data.dart';
import 'package:flutter/material.dart';

class WhiteCard extends StatelessWidget {
  const WhiteCard({
    super.key,
    required this.appBarHeight,
  });

  final double appBarHeight;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: appBarHeight - 60,
      left: MediaQuery.of(context).size.width / 2 - 295 / 2,
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 300),
        opacity: appBarHeight == 180 ? 1.0 : 0.0,
        child: IgnorePointer(
          ignoring: appBarHeight != 180, // Prevent taps when invisible
          child: Container(
            width: 295,
            height: 90,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(28),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                )
              ],
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                WhiteCardData(
                  icon: Assets.iconsIncomes,
                  title: 'الدخل',
                  amount: '000 654',
                ),
                VerticalDivider(
                  color: AppColors.deviderColor,
                ),
                WhiteCardData(
                  icon: Assets.iconsExpense,
                  title: 'الصرف',
                  amount: '000 405',
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

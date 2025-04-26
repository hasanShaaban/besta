import 'package:besta/core/utils/app_text_style.dart';
import 'package:besta/core/utils/assets.dart';
import 'package:besta/core/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar(
      {super.key, required this.screens, required this.onTabTapped});

  final List<Widget> screens;
  final Function(int index) onTabTapped;
  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      screens: screens,
      onItemSelected: onTabTapped,
      navBarHeight: 80,
      backgroundColor: AppColors.backgroundColor,
      resizeToAvoidBottomInset: true,
      navBarStyle: NavBarStyle.style1,
      decoration: NavBarDecoration(
          colorBehindNavBar: AppColors.backgroundColor,
          boxShadow: [
            BoxShadow(
              color: AppColors.deviderColor.withOpacity(0.3),
              blurRadius: 6,
              offset: const Offset(0, -4),
            )
          ],
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(22),
            topRight: Radius.circular(22),
          )),
      items: [
        buildNavTabs(Assets.iconsHome, 'الرئيسية'),
        buildNavTabs(Assets.iconsChartHistogram, 'تحليل'),
        buildNavTabs(Assets.iconsSettings, 'الإعدادات'),
        buildNavTabs(Assets.iconsCalendarDays, 'التقويم'),
      ],
    );
  }

  PersistentBottomNavBarItem buildNavTabs(String icon, String title) {
    return PersistentBottomNavBarItem(
      contentPadding: 0,
      iconSize: 26,
      icon: Padding(
        padding: const EdgeInsets.only(left: 5),
        child: SvgPicture.asset(
          icon,
          color: AppColors.primaryColor,
        ),
      ),
      inactiveIcon: SvgPicture.asset(
        icon,
        color: AppColors.deviderColor,
      ),
      title: title,
      textStyle: AppTextStyle.cairoRegular18,
      activeColorPrimary: AppColors.primaryColor,
      activeColorSecondary: AppColors.primaryColor,
    );
  }
}
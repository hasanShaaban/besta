import 'package:besta/core/utils/app_text_style.dart';
import 'package:besta/core/utils/assets.dart';
import 'package:besta/core/utils/constants.dart';
import 'package:besta/feature/on_boarding/presentation/widgets/animated_shape.dart';
import 'package:besta/feature/on_boarding/presentation/widgets/on_boarding_dots_indecators.dart';
import 'package:besta/feature/on_boarding/presentation/widgets/on_boarding_page.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnBoardingViewBody extends StatefulWidget {
  const OnBoardingViewBody({super.key});

  @override
  State<OnBoardingViewBody> createState() => _OnBoardingViewBodyState();
}

class _OnBoardingViewBodyState extends State<OnBoardingViewBody> {
  final PageController _pageController = PageController();

  int _currentPage = 0;

  final List<double> _rotationAngles = [
    0,
    -110,
    -37,
  ];

  final List<Color> _colors = [
    AppColors.thirdColor,
    AppColors.secondryColor,
    AppColors.fourthColor,
  ];

  final List<Map<String, double>> _positions = [
    {'top': 20, 'left': -50},
    {'top': -40, 'left': 65},
    {'top': 65, 'left': 30},
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextButton(
          onPressed: () {},
          child: Text(
            'تخط',
            style: AppTextStyle.cairoRegular16.copyWith(
                color: AppColors.deviderColor,
                decoration: TextDecoration.underline),
          ),
        ),
        const SizedBox(height: 65),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'اهلا بك في',
              style: AppTextStyle.cairoBold30
                  .copyWith(color: AppColors.primaryColor),
            ),
            const SizedBox(width: 5),
            SvgPicture.asset(
              Assets.iconsBesta,
              height: 24.5,
            )
          ],
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 500,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              AnimatedShape(
                  positions: _positions,
                  currentPage: _currentPage,
                  rotationAngles: _rotationAngles,
                  colors: _colors),
              PageView(
                controller: _pageController,
                onPageChanged: (value) {
                  setState(() {
                    _currentPage = value;
                  });
                },
                children: const [
                  OnBoardingPage(
                      text:
                          'تابع أرباحك اليومية، وراقب مصروفاتك، وتحكّم في رحلتك المالية يومًا بيوم',
                      image: Assets.imagesOnBoarding1),
                  OnBoardingPage(
                      text:
                          'تتبع دقيق لمصاريف السيارة ومصاريفك الشخصية في تطبيق واحد، تنظيم يومي أسهل، وتحكم مالي أوضح.',
                      image: Assets.imagesOnBoarding2),
                  OnBoardingPage(
                      text:
                          'تابع أداءك المالي أسبوعيًا مع تقارير مفصلة ورسوم بيانية تجعل الصورة أوضح.',
                      image: Assets.imagesOnBoarding3),
                ],
              ),
              OnBoardingDotsIndecator(currentPage: _currentPage)
            ],
          ),
        ),
        Visibility(
          visible: _currentPage == 2,
          child: Align(
            alignment: Alignment.center,
            child: SizedBox(
              width: 135,
              height: 53,
              child: TextButton(
                  style: TextButton.styleFrom(
                      backgroundColor: AppColors.primaryColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32))),
                  onPressed: () {},
                  child: Text(
                    'ابدأ الأن',
                    style: AppTextStyle.cairoBold18
                        .copyWith(color: AppColors.backgroundColor),
                  )),
            ),
          ),
        )
      ],
    );
  }
}

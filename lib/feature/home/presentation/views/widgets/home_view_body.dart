import 'package:besta/core/utils/constants.dart';
import 'package:besta/feature/home/presentation/views/widgets/custom/app_bar/custom_app_bar.dart';
import 'package:besta/feature/home/presentation/views/widgets/custom/card/custom_card.dart';
import 'package:besta/feature/home/presentation/views/widgets/sctions_devider.dart';
import 'package:besta/feature/home/presentation/views/widgets/today_card_empty.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  static const double initAppBarHeight = 180;
  static const double minHeight = 80;
  ScrollController scrollController = ScrollController();

  double appBarHeight = initAppBarHeight;
  @override
  void initState() {
    super.initState();
    scrollController.addListener(_handleScroll);
  }

  void _handleScroll() {
    double offset = scrollController.offset;

    setState(() {
      // Decrease height based on scroll, but never less than minHeight
      appBarHeight =
          (initAppBarHeight - offset).clamp(minHeight, initAppBarHeight);
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
            controller: scrollController,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22),
              child: Column(
                children: [
                  SizedBox(height: appBarHeight + 42),
                  const SetctionsDevider(),
                  const SizedBox(height: 20),
                  // ignore: prefer_const_constructors
                  CustomCard(
                    date: 'الأحد 25-12',
                    width: double.infinity,
                    height: 90,
                    fillColor: AppColors.secondryColor,
                    child: const TodayCardEmpty(),
                  ),
                  const SizedBox(
                    height: 800,
                  )
                ],
              ),
            )),
        CustomAppBar(appBarHeight: appBarHeight),
      ],
    );
  }
}

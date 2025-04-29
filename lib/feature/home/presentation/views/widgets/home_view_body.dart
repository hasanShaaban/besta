import 'package:besta/core/utils/app_text_style.dart';
import 'package:besta/core/utils/assets.dart';
import 'package:besta/core/utils/constants.dart';
import 'package:besta/feature/home/presentation/views/widgets/custom/app_bar/custom_app_bar.dart';
import 'package:besta/feature/home/presentation/views/widgets/custom/card/custom_card.dart';
import 'package:besta/feature/home/presentation/views/widgets/sctions_devider.dart';
import 'package:besta/feature/home/presentation/views/widgets/this_week_list_view.dart';
import 'package:besta/feature/home/presentation/views/widgets/today_card_empty.dart';
import 'package:fl_chart/fl_chart.dart';
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

  final List<String> days = [
    'الأحد',
    'الاثنين',
    'الثلاثاء',
    'الأربعاء',
    'الخميس',
    'الجمعة',
    'السبت'
  ];

  final List<double> group1Values = [
    650,
    500,
    400,
    600,
    700,
    500,
    600
  ]; // Purple bars
  final List<double> group2Values = [
    600,
    450,
    300,
    550,
    500,
    700,
    500
  ]; // Cyan bars
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          controller: scrollController,
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22),
            child: Column(
              children: [
                SizedBox(height: appBarHeight + 42),
                const SetctionsDevider(
                  title: 'بيانات اليوم :',
                  icon: Assets.iconsCalendarLines,
                ),
                const SizedBox(height: 20),
                // ignore: prefer_const_constructors
                CustomCard(
                  date: Text(
                    'الأحد 25-12',
                    style: AppTextStyle.cairoSemiBold14
                        .copyWith(color: AppColors.backgroundColor),
                  ),
                  width: double.infinity,
                  height: 90,
                  fillColor: AppColors.secondryColor,
                  child: const TodayCardEmpty(),
                ),
                const SizedBox(height: 20),
                const SetctionsDevider(
                    title: 'هذا الأسبوع :',
                    icon: Assets.iconsCalendarWeek,
                    action: 'التفاصيل'),

                const ThisWeekListView(),
                const SizedBox(height: 15),
                SizedBox(
                    height: 310,
                    width: double.infinity,
                    child: BarChart(
                      BarChartData(
                        maxY: 750,
                        barGroups: List.generate(days.length, (i) {
                          return BarChartGroupData(
                            x: i,
                            barRods: [
                              BarChartRodData(
                                toY: group1Values[i],
                                width: 10,
                                color: AppColors.secondryColor,
                              ),
                              BarChartRodData(
                                toY: group2Values[i],
                                width: 10,
                                color: AppColors.thirdColor,
                              ),
                            ],
                            barsSpace: 4,
                          );
                        }),
                        titlesData: FlTitlesData(
                          show: true,
                          rightTitles: const AxisTitles(
                              sideTitles: SideTitles(showTitles: false)),
                          topTitles: const AxisTitles(
                              sideTitles: SideTitles(showTitles: false)),
                          leftTitles: const AxisTitles(
                            sideTitles:
                                SideTitles(showTitles: true, reservedSize: 40),
                          ),
                          bottomTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: true,
                              getTitlesWidget: (value, meta) {
                                final index = value.toInt();
                                return SideTitleWidget(
                                  axisSide: meta.axisSide,
                                  child: Text(
                                    days[index],
                                    style: const TextStyle(
                                        fontSize: 12, color: Colors.deepPurple),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        gridData: const FlGridData(
                          drawHorizontalLine: true,
                          drawVerticalLine: false
                        ),
                        borderData: FlBorderData(
                          border: const Border(
                            bottom: BorderSide(width: 1),
                            left: BorderSide(width: 1),
                            right: BorderSide.none,
                            top: BorderSide.none,
                          )
                        ),
                        groupsSpace: 25,
                      ),
                    )),
                const SizedBox(height: 15)
              ],
            ),
          ),
        ),
        CustomAppBar(appBarHeight: appBarHeight),
      ],
    );
  }
}

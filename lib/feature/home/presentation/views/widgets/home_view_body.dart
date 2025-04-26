import 'package:besta/core/utils/constants.dart';
import 'package:besta/feature/home/presentation/views/widgets/custom/app_bar/custom_app_bar.dart';
import 'package:flutter/widgets.dart';

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
      appBarHeight = (initAppBarHeight - offset).clamp(minHeight, initAppBarHeight);
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
          child: Container(
            color: AppColors.backgroundColor,
            height: 1000,
          ),
        ),
        CustomAppBar(appBarHeight: appBarHeight),
      ],
    );
  }
}
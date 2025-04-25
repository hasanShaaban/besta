
import 'package:besta/feature/home/presentation/views/widgets/app_bar_background.dart';
import 'package:besta/feature/home/presentation/views/widgets/white_cart.dart';
import 'package:flutter/widgets.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.appBarHeight,
  });

  final double appBarHeight;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        AppBarBackGround(appBarHeight: appBarHeight),
        WhiteCard(appBarHeight: appBarHeight),
      ],
    );
  }
}
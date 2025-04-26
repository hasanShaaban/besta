import 'package:besta/feature/home/presentation/views/widgets/custom/navigation_bar/custom_navigation_bar.dart';
import 'package:besta/feature/home/presentation/views/widgets/home_view_body.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});
  static const String routeName = 'home';

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int currentIndex = 0;

  final List<Widget> screens = const [
    HomeViewBody(),
    Center(child: Text('Search')),
    Center(child: Text('trrtr')),
    Center(child: Text('sdfgr')),
  ];

  void _onTabTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: screens[currentIndex],
          bottomNavigationBar:
              CustomNavigationBar(screens: screens, onTabTapped: _onTabTapped)),
    );
  }
}

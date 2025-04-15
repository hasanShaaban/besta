import 'package:besta/feature/splash/presentation/widgets/splach_view_body.dart';
import 'package:flutter/material.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});
  static const routeName = 'splash';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SplashViewBody(),
    );
  }
}



import 'package:besta/core/functions/on_generat_route.dart';

import 'package:besta/core/utils/constants.dart';
import 'package:besta/feature/splash/presentation/splash_view.dart';
import 'package:flutter/material.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.backgroundColor,
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
        fontFamily: 'Cairo'
      ),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: onGenerateRoute,
      initialRoute: SplashView.routeName,
    );
  }
}
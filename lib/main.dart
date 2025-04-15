
import 'package:besta/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(child: Lottie.asset(Assets.imagesOnBoarding1, width: 200)),
      ),
    );
  }
}
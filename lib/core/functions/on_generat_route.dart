import 'package:besta/feature/Auth/presentation/views/Login_view.dart';
import 'package:besta/feature/on_boarding/presentation/on_boarding_view.dart';
import 'package:besta/feature/splash/presentation/splash_view.dart';
import 'package:flutter/material.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
   switch (settings.name){
    case SplashView.routeName:
      return MaterialPageRoute(builder: (context) => const SplashView());
    case OnBoardingView.routeName:
      return MaterialPageRoute(builder: (context) => const OnBoardingView());
    case LoginView.routeName:
      return MaterialPageRoute(builder: (context) => const LoginView());
    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
   }
}
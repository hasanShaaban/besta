import 'package:besta/feature/Auth/presentation/views/widgets/signup_view_body.dart';
import 'package:flutter/material.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});
  static const routeName = 'signup';
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
        child: Scaffold(
      body: SignupViewBody(),
    ));
  }
}
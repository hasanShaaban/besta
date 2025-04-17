import 'package:besta/feature/Auth/presentation/views/widgets/login_view_body.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  static const routeName = 'Login';
  @override
  Widget build(BuildContext context) {
    return const SafeArea(child: Scaffold(
      body: LoginViewBody(),
    ));
  }
}


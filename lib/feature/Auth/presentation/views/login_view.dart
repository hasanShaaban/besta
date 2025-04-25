import 'package:besta/core/services/get_it_service.dart';
import 'package:besta/feature/Auth/domain/repos/auth_repo.dart';
import 'package:besta/feature/Auth/presentation/manager/singin_cubit/singin_cubit.dart';
import 'package:besta/feature/Auth/presentation/views/widgets/login_view_body_bloc_consumer.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  static const routeName = 'Login';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: BlocProvider(
        create: (context) => SinginCubit(getIt<AuthRepo>()),
        child: const LoginViewBodyBlocConsumer(),
      ),
    ));
  }
}

import 'package:besta/core/services/get_it_service.dart';
import 'package:besta/feature/Auth/domain/repos/auth_repo.dart';
import 'package:besta/feature/Auth/presentation/manager/signup_cubit/singup_cubit.dart';
import 'package:besta/feature/Auth/presentation/views/widgets/signup_view_body_bloc_consumer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});
  static const routeName = 'signup';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SingupCubit(getIt<AuthRepo>()),
      child: const SafeArea(
          child: Scaffold(
        body: SignupViewBodyBlocConsumer(),
      )),
    );
  }
}

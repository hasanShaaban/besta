import 'dart:developer';

import 'package:besta/core/services/get_it_service.dart';
import 'package:besta/feature/Auth/domain/repos/auth_repo.dart';
import 'package:besta/feature/Auth/presentation/manager/singin_cubit/singin_cubit.dart';
import 'package:besta/feature/Auth/presentation/views/widgets/login_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

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

class LoginViewBodyBlocConsumer extends StatelessWidget {
  const LoginViewBodyBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SinginCubit, SigninState>(
      listener: (context, state) {
        if (state is SigninSuccess) {
          log('login success');
        } else if (state is SigninFailure) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
            inAsyncCall: state is SigninLoading ? true : false,
            child: const LoginViewBody());
      },
    );
  }
}

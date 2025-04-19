import 'dart:developer';

import 'package:besta/feature/Auth/presentation/manager/signup_cubit/singup_cubit.dart';
import 'package:besta/feature/Auth/presentation/views/widgets/signup_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignupViewBodyBlocConsumer extends StatelessWidget {
  const SignupViewBodyBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SingupCubit, SingupState>(
      listener: (context, state) {
        if (state is SingupSuccess) {
          log('login success');
        }
        if (state is SingupFailure) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
            inAsyncCall: state is SingupLoading ? true : false,
            child: const SignupViewBody());
      },
    );
  }
}

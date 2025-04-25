import 'package:besta/core/services/get_it_service.dart';
import 'package:besta/core/widgets/custom_modal_progree_hud.dart';
import 'package:besta/feature/Auth/data/repos/auth_local_data_source.dart';
import 'package:besta/feature/Auth/presentation/manager/singin_cubit/singin_cubit.dart';
import 'package:besta/feature/Auth/presentation/views/widgets/login_view_body.dart';
import 'package:besta/feature/home/presentation/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class LoginViewBodyBlocConsumer extends StatelessWidget {
  const LoginViewBodyBlocConsumer({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SinginCubit, SigninState>(
      listener: (context, state) {
        if (state is SigninSuccess) {
          final authDataSource = getIt<AuthLocalDataSource>();
          authDataSource.setAuthSeen();
          Navigator.of(context).pushReplacementNamed(HomeView.routeName);
        } else if (state is SigninFailure) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
      builder: (context, state) {
        return CustomModalProgreeHud(
            inAsyncCall: state is SigninLoading ? true : false,
            child: const LoginViewBody());
      },
    );
  }
}

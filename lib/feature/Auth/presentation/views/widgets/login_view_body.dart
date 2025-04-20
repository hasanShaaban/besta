import 'package:besta/core/utils/assets.dart';
import 'package:besta/core/widgets/skip_button.dart';
import 'package:besta/feature/Auth/presentation/manager/singin_cubit/singin_cubit.dart';
import 'package:besta/feature/Auth/presentation/views/signup_view.dart';
import 'package:besta/feature/Auth/presentation/views/widgets/auth_header.dart';
import 'package:besta/feature/Auth/presentation/views/widgets/auth_redirect_text.dart';
import 'package:besta/feature/Auth/presentation/views/widgets/custom_auth_btton.dart';
import 'package:besta/feature/Auth/presentation/views/widgets/custom_text_form_field.dart';
import 'package:besta/feature/Auth/presentation/views/widgets/google_button.dart';
import 'package:besta/feature/Auth/presentation/views/widgets/or_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  late String password, email;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(22),
        child: Form(
          autovalidateMode: autovalidateMode,
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Align(
                alignment: Alignment.topRight,
                child: SkipButton(),
              ),
              const SizedBox(height: 70),
              const AuthHeader(
                description:
                    'يمكنك ربط حسابك مع تخزين سحابي لحماية بياناتك من الضياع',
                authType: 'تسجيل الدخول',
              ),
              const SizedBox(height: 22),
              CustomTextFormField(
                onSaved: (value) {
                  email = value!;
                },
                hintText: 'البريد الالكتروني',
                textInputType: TextInputType.emailAddress,
                prefexIcon: SvgPicture.asset(Assets.iconsEnvelope,
                    width: 24, height: 22),
              ),
              const SizedBox(height: 18),
              CustomTextFormField(
                onSaved: (value) {
                  password = value!;
                },
                hintText: 'كلمة المرور',
                textInputType: TextInputType.emailAddress,
                prefexIcon: SvgPicture.asset(Assets.iconsPassword,
                    width: 24, height: 22),
              ),
              const SizedBox(height: 18),
              AuthRedirectText(
                staitcText: 'لا تمتلك حساب؟ يمكنك انشاء',
                redirectorText: ' حساب جديد',
                onTap: () {
                  Navigator.pushNamed(context, SignupView.routeName);
                },
              ),
              const SizedBox(height: 30),
              CustomAuthButton(onPressed: () {
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();
                  context.read<SinginCubit>().singin(email, password);
                } else {
                  autovalidateMode = AutovalidateMode.always;
                  setState(() {});
                }
              }),
              const SizedBox(height: 18),
              const OrDivider(),
              const SizedBox(height: 23),
              GoogleButton(onPressed: () {
                context.read<SinginCubit>().signInWithGoogle();
              })
            ],
          ),
        ),
      ),
    );
  }
}

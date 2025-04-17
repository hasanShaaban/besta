import 'package:besta/core/utils/app_text_style.dart';
import 'package:besta/core/utils/assets.dart';
import 'package:besta/core/utils/constants.dart';
import 'package:besta/core/widgets/skip_button.dart';
import 'package:besta/feature/Auth/presentation/views/widgets/auth_header.dart';
import 'package:besta/feature/Auth/presentation/views/widgets/custom_auth_btton.dart';
import 'package:besta/feature/Auth/presentation/views/widgets/custom_text_form_field.dart';
import 'package:besta/feature/Auth/presentation/views/widgets/google_button.dart';
import 'package:besta/feature/Auth/presentation/views/widgets/or_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(22),
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
              hintText: 'البريد الالكتروني',
              textInputType: TextInputType.emailAddress,
              prefexIcon:
                  SvgPicture.asset(Assets.iconsEnvelope, width: 24, height: 22),
            ),
            const SizedBox(height: 18),
            CustomTextFormField(
              hintText: 'كلمة المرور',
              textInputType: TextInputType.emailAddress,
              prefexIcon:
                  SvgPicture.asset(Assets.iconsPassword, width: 24, height: 22),
            ),
            const SizedBox(height: 18),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'لا تمتلك حساب؟ يمكنك انشاء',
                  style: AppTextStyle.cairoRegular14
                      .copyWith(color: AppColors.primaryColor),
                ),
                GestureDetector(
                  child: Text(
                    ' حساب جديد',
                    style: AppTextStyle.cairoRegular14
                        .copyWith(color: AppColors.thirdColor),
                  ),
                )
              ],
            ),
            const SizedBox(height: 30),
            CustomAuthButton(onPressed: () {}),
            const SizedBox(height: 18),
            const OrDivider(),
            const SizedBox(height: 23),
            GoogleButton(onPressed: (){})
          ],
        ),
      ),
    );
  }
}


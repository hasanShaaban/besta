import 'package:besta/core/utils/assets.dart';
import 'package:besta/core/utils/constants.dart';
import 'package:besta/core/widgets/custom_back_button.dart';
import 'package:besta/core/widgets/skip_button.dart';
import 'package:besta/feature/Auth/presentation/views/widgets/auth_header.dart';
import 'package:besta/feature/Auth/presentation/views/widgets/auth_redirect_text.dart';
import 'package:besta/feature/Auth/presentation/views/widgets/custom_auth_btton.dart';
import 'package:besta/feature/Auth/presentation/views/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
class SignupViewBody extends StatelessWidget {
  const SignupViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(22),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Row(
              children: [
                SkipButton(),
                Spacer(),
                CustomBackButton(
                  color: AppColors.deviderColor,
                  size: 30,
                )
              ],
            ),
            const SizedBox(height: 70),
            const AuthHeader(
              description: 'أنشئ حساب على قاعدة بياناتنا لنحفظ لك معلوماتك',
              authType: 'حساب جديد',
            ),
            const SizedBox(height: 11),
            CustomTextFormField(
              hintText: 'الاسم',
              textInputType: TextInputType.text,
              prefexIcon: SvgPicture.asset(
                Assets.iconsAccountCircle,
                width: 24,
                color: AppColors.primaryColor,
              ),
            ),
            const SizedBox(height: 18),
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
            CustomTextFormField(
              hintText: 'تأكيد كلمة المرور',
              textInputType: TextInputType.emailAddress,
              prefexIcon:
                  SvgPicture.asset(Assets.iconsPassword, width: 24, height: 22),
            ),
            const SizedBox(height: 10),
            AuthRedirectText(
              staitcText: 'لديك حساب بالفعل؟',
              redirectorText: 'تسجيل الدخول',
              onTap: () {
                Navigator.pop(context);
              },
            ),
            const SizedBox(height: 28),
            CustomAuthButton(onPressed: (){})
          ],
        ),
      ),
    );
  }
}

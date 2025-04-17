import 'package:besta/core/utils/app_text_style.dart';
import 'package:besta/core/utils/constants.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key,
      required this.hintText,
      this.suffexIcon,
      required this.textInputType,
      this.onSaved,
      this.obscureText = false,
      required this.prefexIcon});

  final String hintText;
  final Widget prefexIcon;
  final Widget? suffexIcon;
  final TextInputType textInputType;
  final Function(String?)? onSaved;
  final bool obscureText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      onSaved: onSaved,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'هذا الحقل مطلوب';
        }
        return null;
      },
      keyboardType: textInputType,
      decoration: InputDecoration(
          hintText: hintText,
          hintStyle: AppTextStyle.cairoSemiBold14
              .copyWith(color: AppColors.primaryColor),
          suffixIcon: suffexIcon,
          prefixIcon: Padding(
            padding: const EdgeInsets.only(right: 16, left: 8),
            child: prefexIcon,
          ),
          prefixIconConstraints: const BoxConstraints(maxWidth: 50),
          prefixIconColor: AppColors.primaryColor,
          suffixIconColor: AppColors.primaryColor,
          filled: true,
          fillColor: AppColors.backgroundColor,
          border: buildBorder(),
          enabledBorder: buildBorder()),
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(27),
        borderSide: const BorderSide(width: 2, color: AppColors.primaryColor));
  }
}

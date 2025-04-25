import 'package:besta/core/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class CustomModalProgreeHud extends StatelessWidget {
  const CustomModalProgreeHud(
      {super.key, required this.inAsyncCall, required this.child});
  final bool inAsyncCall;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: inAsyncCall,
      color: Colors.white,
      progressIndicator: const CircularProgressIndicator(
        color: AppColors.thirdColor,
      ),
      child: child,
    );
  }
}

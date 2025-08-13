import 'dart:math';

import 'package:authenticate/authenticate.dart';
import 'package:authenticate/src/presentation/view/reset_password/reset_password_screen.dart';
import 'package:authenticate/src/presentation/widgets/curve_form_field.dart';
import 'package:authenticate/src/presentation/widgets/curve_large_button.dart';
import 'package:flutter/material.dart';
class OtpVerificationSheet{
  final TextEditingController otpController;
  OtpVerificationSheet({required this.otpController});
  void show(BuildContext context) {
    final l10n = context.l10n;
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
      return Container(
        width: MediaQuery.of(context).size.width,
        height: 350,
        child: Padding(
          padding:  EdgeInsets.only(left: 12, right: 12, top: 50),
          child: Column(
            children: [
              CurveTextField(label: l10n.otp, controller: otpController),
              SizedBox(height:40,),
              CurveLageButton(label: l10n.verify, onPressed: (){
                Navigator.push<void>(
                  context,
                  MaterialPageRoute<void>(
                    builder: (context) => const ResetPasswordScreen(),
                  ),
                );
              })
            ],
          ),
        ),
      );
    },);
  }
}

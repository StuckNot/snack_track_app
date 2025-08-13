import 'package:authenticate/l10n/l10n.dart';
import 'package:authenticate/src/presentation/view/reset_password/reset_password_screen.dart';
import 'package:authenticate/src/presentation/widgets/curve_form_field.dart';
import 'package:authenticate/src/presentation/widgets/curve_large_button.dart';
import 'package:flutter/material.dart';
class OtpVerificationView extends StatelessWidget {
  TextEditingController otpController;
  OtpVerificationView({required this.otpController, super.key,
  });

  @override
  Widget build(BuildContext context) {
    final l10n=context.l10n;
    return Padding(padding: const EdgeInsets.only(left: 12, right: 12, top: 50),
      child: SingleChildScrollView(
        child: Column(
          children: [
            CurveTextField(label: l10n.otp , controller: otpController),
            SizedBox(height: 40,),
            CurveLageButton(label: l10n.verify, onPressed: (){
              Navigator.push<void>(
                context,
                MaterialPageRoute<void>(
                  builder: (context) => ResetPasswordScreen(),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}

import 'package:authenticate/l10n/l10n.dart';
import 'package:authenticate/src/presentation/view/otpverification/otp_verification_screen.dart';
import 'package:authenticate/src/presentation/widgets/curve_form_field.dart';
import 'package:authenticate/src/presentation/widgets/curve_large_button.dart';
import 'package:flutter/material.dart';
class ForgotPasswordView extends StatelessWidget {
  final TextEditingController emailController;

  const ForgotPasswordView({super.key,
    required this.emailController,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Padding(padding: const EdgeInsets.only(left: 12, right: 12, top: 50),
      child: SingleChildScrollView(
        child: Column(
          children: [
            CurveTextField(label:l10n.email , controller: emailController),
            SizedBox(height: 40,),
            CurveLageButton(label: l10n.sendOtp, onPressed: (){
              Navigator.push<void>(
                context,
                MaterialPageRoute<void>(
                  builder: (context) => OtpVerificationScreen(),
                ),
              );
            })
          ],
        ),
      ),
    );
  }
}

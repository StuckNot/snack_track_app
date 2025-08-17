import 'package:authenticate/l10n/l10n.dart';
import 'package:authenticate/src/presentation/theme/auth_padding.dart';
import 'package:authenticate/src/presentation/view/forgot_password/otp_verification_form.dart';
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
    return
      Padding(padding: AuthPadding.common,
      child:
    SingleChildScrollView(
        child: Column(
          children: [
            CurveTextField(label:l10n.email,
                hintText: l10n.enterEmail,
                controller: emailController),
            SizedBox(height: 40,),
            CurveLageButton(label: l10n.sendOtp, onPressed: (){
              OtpVerificationForm().show(context);
            })
          ],
        ),
      ),
    );
  }
}

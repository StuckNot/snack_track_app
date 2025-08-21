import 'package:authenticate/authenticate.dart';
import 'package:authenticate/src/presentation/view/reset_password/reset_password_screen.dart';
import 'package:authenticate/src/presentation/widgets/curve_large_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class OtpVerificationForm{
  late String otpCode;
  void show(BuildContext context) {
    final l10n = context.l10n;
    showDialog<void>(
      context: context,
      builder: (context) {
        final isLandscape = MediaQuery.of(context).orientation ==
            Orientation.landscape;
        return AlertDialog(
          content: SingleChildScrollView(
            child: SizedBox(
              width: isLandscape
                  ?MediaQuery.of(context).size.width *0.5
                  :MediaQuery.of(context).size.width *0.7,
              height: isLandscape
                  ? MediaQuery.of(context).size.height * 0.5
                  : MediaQuery.of(context).size.height * 0.25,
              child: Padding(
                padding: const EdgeInsets.only(left: 12, right: 12, top: 20,bottom: 20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      l10n.otp,
                      style: const TextStyle(fontSize: 24, color: Colors.grey),
                    ),
                    const SizedBox(height: 10),
                    OtpTextField(
                      enabledBorderColor: Colors.lightGreen.shade200,
                      showFieldAsBox: true,
                      focusedBorderColor: Colors.green,
                      onSubmit: (String verificationCode) {
                        otpCode=verificationCode;
                      },
                    ),
                    const SizedBox(height: 20),
                    CurveLageButton(
                      label: l10n.verify,
                      onPressed: () {
                        print(otpCode);
                        Navigator.push<void>(
                          context,
                          MaterialPageRoute<void>(
                            builder: (context) => const ResetPasswordScreen(),
                          ),
                        );
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

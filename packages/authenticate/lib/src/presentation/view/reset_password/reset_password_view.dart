import 'package:authenticate/l10n/l10n.dart';
import 'package:authenticate/src/presentation/widgets/curve_form_field.dart';
import 'package:authenticate/src/presentation/widgets/curve_large_button.dart';
import 'package:flutter/material.dart';
class ResetPasswordView extends StatelessWidget {
  final TextEditingController resetPasswordController;
  ResetPasswordView({required this.resetPasswordController, super.key,
  });

  @override
  Widget build(BuildContext context) {
    final l10n =context.l10n;
    return Padding(padding: const EdgeInsets.only(left: 12, right: 12, top: 50),
      child: SingleChildScrollView(
        child: Column(
          children: [
            CurveTextField(label: l10n.resetPassword, controller: resetPasswordController),
            SizedBox(height: 40,),
            CurveLageButton(label: l10n.resetPassword, onPressed: (){}),
          ],
        ),
      ),
    );
  }
}

import 'package:authenticate/l10n/l10n.dart';
import 'package:authenticate/src/presentation/theme/auth_padding.dart';
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
    return Padding(padding: AuthPadding.common,
      child: SingleChildScrollView(
        child: Column(
          children: [
            CurveTextField(label: l10n.resetPassword,
                hintText: l10n.enterPassword,
                controller: resetPasswordController
            ),
            SizedBox(height: 40,),
            CurveLageButton(label: l10n.resetPassword, onPressed: (){}),
          ],
        ),
      ),
    );
  }
}

import 'package:authenticate/l10n/l10n.dart';
import 'package:authenticate/src/presentation/view/forgot_password/forgot_password_view.dart';
import 'package:authenticate/src/presentation/widgets/scaffold_base.dart';
import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  late TextEditingController emailController;
  late TextEditingController otpController;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return ScaffoldBase(
      title: l10n.appTitle,
      child: ForgotPasswordView(emailController: emailController),
    );
  }
}

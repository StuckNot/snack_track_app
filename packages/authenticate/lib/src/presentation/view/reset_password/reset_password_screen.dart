import 'package:authenticate/l10n/l10n.dart';
import 'package:authenticate/src/presentation/theme/auth_padding.dart';
import 'package:authenticate/src/presentation/view/reset_password/reset_password_view.dart';
import 'package:authenticate/src/presentation/widgets/scaffold_base.dart';
import 'package:flutter/material.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  late TextEditingController resetPasswordController;

  @override
  void initState() {
    super.initState();
    resetPasswordController = TextEditingController();
  }
  @override
  void dispose() {
    resetPasswordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return ScaffoldBase(child: ResetPasswordView(resetPasswordController: resetPasswordController, ), title: l10n.appTitle);
  }
}

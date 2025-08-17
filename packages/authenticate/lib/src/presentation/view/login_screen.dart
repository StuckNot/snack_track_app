import 'package:authenticate/l10n/l10n.dart';
import 'package:authenticate/src/domain/entities/login_request.dart';
import 'package:authenticate/src/presentation/bloc/login_bloc.dart';
import 'package:authenticate/src/presentation/view/login_view.dart';
import 'package:authenticate/src/presentation/widgets/curve_large_button.dart';
import 'package:authenticate/src/presentation/widgets/scaffold_base.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final ValueNotifier<bool> _obscure = ValueNotifier(true);

  void _changeValue() {
    _obscure.value = !_obscure.value;
  }

  late TextEditingController emailController;
  late TextEditingController passwdController;
  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwdController = TextEditingController();
  }

  @override
  void dispose() {
    _obscure.dispose();
    emailController.dispose();
    passwdController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return ScaffoldBase(
      title: l10n.appTitle,

      child: BlocProvider(
        create: (context) => LoginBloc(),
        child: LoginView(
          emailController: emailController,
          passwdController: passwdController,
          obscure: _obscure,
          changeObscure: _changeValue,
        ),
      ),
    );
  }
}

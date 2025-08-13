import 'package:authenticate/l10n/l10n.dart';
import 'package:authenticate/src/domain/entities/login_request.dart';
import 'package:authenticate/src/presentation/bloc/login_bloc.dart';
import 'package:authenticate/src/presentation/view/forgot_password/forgot_password_screen.dart';
import 'package:authenticate/src/presentation/widgets/curve_form_field.dart';
import 'package:authenticate/src/presentation/widgets/curve_large_button.dart';
import 'package:authenticate/src/presentation/widgets/curve_small_button.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginView extends StatelessWidget {
  TextEditingController emailController;
  TextEditingController passwdController;
  ValueListenable<bool> obscure;
  GestureTapCallback? changeObscure;
  LoginView({this.isMinimal=true,super.key,
    required this.emailController,
    required this.passwdController,
    this.changeObscure,
    required this.obscure,

  });
  final bool isMinimal;

  @override
  Widget build(BuildContext context) {

    final l10n = context.l10n;
    return Padding(
      padding: const EdgeInsets.only(left: 12, right: 12, top: 50),
      child: BlocListener<LoginBloc,LoginStates>(
        listener: (context,state){
          if(state is LoginFailure){
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('message : ${state.response.message} | status: ${state.response.statusCode}'),));
          }
          if(state is LoginSuccess){
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('message : ${state.response.message} | status: ${state.response.statusCode}')));
          }
        },
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CurveTextField(
                label: l10n.email,
                controller: emailController,

                sufixIcon: const Icon(Icons.email_rounded),
              ),
              const SizedBox(
                height: 40,
              ),
              ValueListenableBuilder(
                valueListenable: obscure,
                builder: (context, value, child) {
                  return CurveTextField(
                    label: l10n.password,
                    obscure: value,
                    controller: passwdController,
                    sufixIcon: GestureDetector(
                      onTap: changeObscure,
                      child: value?const Icon(Icons.visibility_rounded)
                          :const Icon(Icons.visibility_off_rounded),
                    ),
                  );
                },
              ),

              const SizedBox(
                height: 40,
              ),

                  // Text(
                //   l10n.keepLogin,
                  //   style: const TextStyle(color: Colors.grey, fontSize: 15),
                  // ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push<void>(
                        context,
                        MaterialPageRoute<void>(
                          builder: (context) => ForgotPasswordScreen(),
                        ),
                      );
                    },
                    child:  Text(
                      l10n.forgotPassword,
                      style: const TextStyle(fontSize: 15),
                    ),
                  ),

              const SizedBox(
                height: 40,
              ),
              CurveLageButton(
                label: l10n.loginText,
                onPressed: () {
                  final LoginRequest request =LoginRequest(
                      email: emailController.text.trim(),
                      password: passwdController.text.trim());
                  context.read<LoginBloc>().add(OnButtonPressed(request:request));

                },
                buttonColor: Colors.black,
              ),

              Visibility(
                visible: !isMinimal,
                child: Column(
                  children: [
                    const SizedBox(height: 40),
                    Row(
                      children: [
                        const Expanded(
                          flex: 2,
                          child: Divider(
                            color: Colors.grey,
                            thickness: 0.5,
                          ),
                        ),
                        Expanded(
                          child: Center(
                            child: Text(
                              l10n.orSignUp,
                              style: const TextStyle(fontSize: 15, color: Colors.grey),
                            ),
                          ),
                        ),
                        const Expanded(
                          flex: 2,
                          child: Divider(
                            color: Colors.grey,
                            thickness: 0.5,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 5,
                          child: CurveSmallButton(
                            onPressed: () {},
                            label: l10n.google,
                            logo:Image.asset('packages/authenticate/assets/images/google.png'),
                          ),
                        ),
                        const Expanded(child: SizedBox()),
                        Expanded(
                          flex: 5,
                          child: CurveSmallButton(onPressed: () {},
                            logo: Image.asset('packages/authenticate/assets/images/facebook.png'),
                            label: l10n.facebook,),
                        ),
                      ],
                    ),
                    const SizedBox(height: 125),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                         Text(l10n.dontHaveAccount,style: const TextStyle(
                            color:Colors.grey),),
                        GestureDetector(
                          onTap: () {},
                          child:  Text(l10n.signUp),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

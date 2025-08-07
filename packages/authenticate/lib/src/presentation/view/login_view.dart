import 'package:authenticate/l10n/l10n.dart';
import 'package:authenticate/src/presentation/widgets/curve_form_field.dart';
import 'package:authenticate/src/presentation/widgets/curve_large_button.dart';
import 'package:authenticate/src/presentation/widgets/curve_small_button.dart';
import 'package:flutter/material.dart';




class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {

  ValueNotifier<bool> _obscure = ValueNotifier(true);
  
  void _changeValue() {
    _obscure.value = !_obscure.value;
  }
  late TextEditingController emailMobileController;
  late TextEditingController passwdController;
  @override
  void initState() {
    super.initState();
     _obscure = ValueNotifier(true);
    emailMobileController = TextEditingController();
    passwdController = TextEditingController();
  }
  @override
  void dispose() {
    _obscure.dispose();
    emailMobileController.dispose();
    passwdController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Padding(
      padding: const EdgeInsets.only(left: 12, right: 12, top: 50),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CurveTextField(
              label: l10n.emailOrMobile,
              controller: emailMobileController,
        
              sufixIcon: const Icon(Icons.email_rounded),
            ),
            const SizedBox(
              height: 40,
            ),
            ValueListenableBuilder(
              valueListenable: _obscure,
              builder: (context, value, child) {
                return CurveTextField(
                  label: l10n.password,
                  obscure: value,
                  controller: passwdController,
                  sufixIcon: GestureDetector(
                    onTap: _changeValue,
                    child: value?const Icon(Icons.visibility_rounded)
                        :const Icon(Icons.visibility_off_rounded),
                  ),
                );
              },
            ),
        
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  l10n.keepLogin,
                  style: const TextStyle(color: Colors.grey, fontSize: 15),
                ),
                GestureDetector(
                  onTap: () {},
                  child:  Text(
                    l10n.forgotPassword,
                    style: const TextStyle(fontSize: 15),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            CurveLageButton(
              label: l10n.loginText,
              onPressed: () {},
              buttonColor: Colors.black,
            ),
            const SizedBox(
              height: 40,
            ),
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
            const SizedBox(
              height: 40,
            ),
        
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
            const SizedBox(
              height: 125,
            ),
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
    );
  }
}

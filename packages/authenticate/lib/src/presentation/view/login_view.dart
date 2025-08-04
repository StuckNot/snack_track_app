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
    emailMobileController = TextEditingController();
    passwdController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12, right: 12, top: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CurveTextField(
            label: 'Email or Mobile number',
            controller: emailMobileController,

            suffixicon: const Icon(Icons.email_rounded),
          ),
          const SizedBox(
            height: 40,
          ),
          ValueListenableBuilder(
            valueListenable: _obscure,
            builder: (context, value, child) {
              return CurveTextField(
                label: 'Password',
                obscure: value,
                controller: passwdController,
                suffixicon: GestureDetector(
                  onTap: _changeValue,
                  child: Icon(Icons.remove_red_eye_rounded),
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
              const Text(
                'Keep me logged in',
                style: TextStyle(color: Colors.grey, fontSize: 15),
              ),
              GestureDetector(
                onTap: () {},
                child: const Text(
                  'forgot password?',
                  style: TextStyle(fontSize: 15),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 40,
          ),
          CurveLageButton(
            lebel: 'Login',
            onpress: () {},
            buttoncolor: Colors.black,
          ),
          const SizedBox(
            height: 40,
          ),
          const Row(
            children: [
              Expanded(
                flex: 2,
                child: Divider(
                  color: Colors.grey,
                  thickness: 0.5,
                ),
              ),
              Expanded(
                child: Center(
                  child: Text(
                    'or Sign up',
                    style: TextStyle(fontSize: 15, color: Colors.grey),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Divider(
                  color: Colors.grey,
                  thickness: 0.5,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 40,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 5,
                child: CurveSmallButton(
                  onPressed: () {},
                  lebel: 'Google',
                ),
              ),
              const Expanded(child: SizedBox()),
              Expanded(
                flex: 5,
                child: CurveSmallButton(onPressed: () {}, lebel: 'Facebook'),
              ),
            ],
          ),
          SizedBox(
            height: 125,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Don't have account?",style: TextStyle(color:Colors.grey),),
              GestureDetector(
                onTap: () {},
                child: const Text('Sign up'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

import 'package:authenticate/l10n/l10n.dart';
import 'package:authenticate/src/presentation/view/login_view.dart';
import 'package:flutter/material.dart';
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration:  const BoxDecoration(
              color: Colors.lightGreen,
            ),
            child: Align(
              alignment: const Alignment(0, -0.75),
              child: Text(l10n.appTitle,style: const TextStyle(
                  fontSize: 40,fontWeight: FontWeight.bold),),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.25,
            left: 0,
            right: 0,
            child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration:   BoxDecoration(
                  color: Colors.white,
                  border: Border.all(),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
              child:const LoginView(),
            ),
          ),
        ],
      ),
    );
  }
}

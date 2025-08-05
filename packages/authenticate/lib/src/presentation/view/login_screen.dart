import 'package:authenticate/src/presentation/view/login_view.dart';
import 'package:flutter/material.dart';
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
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
              alignment: Alignment(0, -0.75),
              child: Text('Snack Track',style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold),),
            ),
          ),
          Positioned(
            top: 275,
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

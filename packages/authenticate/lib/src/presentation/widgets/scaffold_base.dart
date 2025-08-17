import 'package:authenticate/src/presentation/theme/auth_padding.dart';
import 'package:flutter/material.dart';

class ScaffoldBase extends StatelessWidget {
  const ScaffoldBase({
    required this.child,
    required this.title,
    this.bottonNav,
    super.key,
  });
  final Widget child;
  final String title;
  final Widget? bottonNav;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20),
        child: bottonNav,
      ),
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              color: Colors.lightGreen,
            ),
            child: Align(
              alignment: const Alignment(0, -0.75),
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.25,
            left: 0,
            right: 0,
            child: Container(
              padding: AuthPadding.page,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(),
                borderRadius: AppBorder.border,
              ),
              child: child,
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class CurveLageButton extends StatelessWidget {
  final String lebel;
  final VoidCallback? onpress;
  final Color? buttoncolor;
  final Color? textcolor;

  const CurveLageButton(
      {super.key,
        required this.lebel,
        required this.onpress,
        this.buttoncolor,
        this.textcolor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 80,
      child: ElevatedButton(
          onPressed:onpress,
          style: ElevatedButton.styleFrom(
            backgroundColor: buttoncolor??Colors.black,

          ),
          child: Text(
            lebel,
            style: TextStyle(
                fontSize: 36,
              color: textcolor ?? Colors.white,
            ),
          )
      ),
    );
  }
}

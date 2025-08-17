import 'package:flutter/material.dart';

class CurveLageButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final Color? buttonColor;
  final Color? textColor;

  const CurveLageButton(
      {super.key,
        required this.label,
        required this.onPressed,
        this.buttonColor,
        this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 60,
      child: ElevatedButton(
          onPressed:onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: buttonColor??Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16)
            )
          ),
          child: Text(
            label,
            style: TextStyle(
                fontSize: 20,
              color: textColor ?? Colors.white,
            ),
          )
      ),
    );
  }
}

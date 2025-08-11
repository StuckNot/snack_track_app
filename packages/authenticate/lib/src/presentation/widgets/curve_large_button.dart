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
      height: 80,
      child: ElevatedButton(
          onPressed:onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: buttonColor??Colors.black,
          ),
          child: Text(
            label,
            style: TextStyle(
                fontSize: 36,
              color: textColor ?? Colors.white,
            ),
          )
      ),
    );
  }
}

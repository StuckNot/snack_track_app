import 'package:flutter/material.dart';
class CurveSmallButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String label;
  final Color? textColor;
  final Image? logo;
  const CurveSmallButton({
    super.key,
    required this.onPressed,
    required this.label,
    this.textColor,
    this.logo
  });


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width:100,
      height: 50,
      child: OutlinedButton(onPressed: onPressed,
          style: OutlinedButton.styleFrom(
            overlayColor: Colors.grey,
          ),
          child:Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (logo != null) SizedBox(height: 20, width: 20, child: logo),
                if (logo!=null)SizedBox(width: 6,),
                Text(
                label,
                style: TextStyle(fontSize: 20,color: textColor??Colors.black),
                ),
              ],
            ),
          )
      ),
    );
  }
}

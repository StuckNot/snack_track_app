import 'package:flutter/material.dart';
class CurveSmallButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String lebel;
  final Color? textcolor;
  final Image? logo;
  const CurveSmallButton({
    super.key,
    required this.onPressed,
    required this.lebel,
    this.textcolor,
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
                ?logo!=null?SizedBox(height:16,width:16,child: logo,):null,
                Text(
                lebel,
                style: TextStyle(fontSize: 20,color: textcolor??Colors.black),
                        ),
              ],
            ),
          )
      ),
    );
  }
}

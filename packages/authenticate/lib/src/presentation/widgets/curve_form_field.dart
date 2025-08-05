import 'package:flutter/material.dart';


class CurveTextField extends StatelessWidget {
  final String lebel;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final int? maxLength;
  final int? maxLines;
  final Widget? preffixIcon;
  final Widget? suffixIcon;
  final bool? obscure;


  const CurveTextField({
    super.key,
    required this.lebel,
    required this.controller,
    this.validator,
    this.maxLength,
    this.maxLines,
    this.preffixIcon,
    this.suffixIcon,
    this.obscure,
  });


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          lebel,
          style:TextStyle(fontSize: 24,color:Colors.grey),
        ),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          validator: validator,
          controller: controller,
          maxLength: maxLength,
          obscureText: obscure??false,
          maxLines: maxLines??1,
          decoration: InputDecoration(
              hintText: 'Enter $lebel',
              counterText: '',
              border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(40),),
              prefixIcon: preffixIcon,
              suffixIcon: suffixIcon,

          ),
        ),
      ],
    );
  }
}
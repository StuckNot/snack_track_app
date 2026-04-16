import 'package:flutter/material.dart';


class CurveTextField extends StatelessWidget {
  final String label;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final int? maxLength;
  final int? maxLines;
  final Widget? prefixIcon;
  final Widget? sufixIcon;
  final bool? obscure;
  final String? hintText;


  const CurveTextField({
    super.key,
    required this.label,
    required this.controller,
    this.hintText,
    this.validator,
    this.maxLength,
    this.maxLines,
    this.prefixIcon,
    this.sufixIcon,
    this.obscure,
  });


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style:const TextStyle(fontSize: 24,color:Colors.grey,fontWeight: FontWeight.bold),
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
              hintText: '$hintText',
              counterText: '',
              border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(16),),
              prefixIcon: prefixIcon,
              suffixIcon: sufixIcon,

          ),
        ),
      ],
    );
  }
}
import 'package:flutter/material.dart';


class CurveTextField extends StatelessWidget {
  final String label;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final int? maxLength;
  final int? maxlines;
  final Widget? preffixicon;
  final Widget? suffixicon;
  final bool? obscure;


  const CurveTextField({
    super.key,
    required this.label,
    required this.controller,
    this.validator,
    this.maxLength,
    this.maxlines,
    this.preffixicon,
    this.suffixicon,
    this.obscure,
  });


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
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
          maxLines: maxlines??1,
          decoration: InputDecoration(
              hintText: 'Enter $label',
              counterText: '',
              border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(40)),
              prefixIcon: preffixicon,
              suffixIcon: suffixicon,

          ),
        ),
      ],
    );
  }
}
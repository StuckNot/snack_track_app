import 'package:flutter/material.dart';

class AuthPadding{

  static const EdgeInsets page = EdgeInsets.all(20);
  static const EdgeInsets common = EdgeInsets.only(left: 12, right: 12, top: 50);

}

class AuthSizedBox{
  static const SizedBox height = SizedBox(height: 20);
  static const SizedBox width = SizedBox(width: 20);
}
class AppBorder{
  static const border = BorderRadius.only(
    topLeft: Radius.circular(16),
    topRight: Radius.circular(16),
  );
}
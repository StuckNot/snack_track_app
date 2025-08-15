import 'package:flutter/material.dart';

class Overview extends StatelessWidget {
  const Overview({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .5,
      width: MediaQuery.of(context).size.width,
      decoration: const ShapeDecoration(shape: ProfileBackgroundShape(),
      color: Colors.blueAccent)
    );
  }
}

class ProfileBackgroundShape extends ShapeBorder{
  const ProfileBackgroundShape();
  final double borderRadius = 60;

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.zero;

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    final path = Path();

    path.moveTo(rect.right, rect.top);

    path.lineTo(rect.width, 0);

    path.quadraticBezierTo(rect.width/2, 20, 0, 0);
    return path;
  }

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    return getOuterPath(rect, textDirection: textDirection);
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {}

  @override
  ShapeBorder scale(double t) => this;
}
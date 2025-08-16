import 'package:flutter/material.dart';

class Overview extends StatelessWidget {
  final num age;
  final num weight;
  final num height;
  const Overview({
    required this.age,
    required this.weight,
    required this.height,
    super.key,
  });

  Widget _overviewCustomContainer(String text, String description) {
    return Container(
      height: 80,
      width: 80,
      decoration: BoxDecoration(
        boxShadow: [BoxShadow(color: Colors.grey.shade300, blurRadius: 5)],
        color: Colors.white70,
        shape: BoxShape.circle,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: const TextStyle(color: Colors.deepOrangeAccent),
            ),
            Text(
              description,
              style: const TextStyle(color: Colors.black54),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * .35,
          width: MediaQuery.of(context).size.width,
          decoration: const ShapeDecoration(
            color: Colors.white,
            shape: ProfileBackgroundShape(),
            shadows: [BoxShadow(color: Colors.black12, blurRadius: 5)],
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height * .25,
          width: MediaQuery.of(context).size.width,
          decoration: const ShapeDecoration(
            color: Colors.black87,
            shape: ProfileBackgroundShape(),
            shadows: [BoxShadow(color: Colors.black26, blurRadius: 5)],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * .08,
          ),
          child: Align(
            alignment: Alignment.topCenter,
            child: CircleAvatar(
              radius: 80,
              backgroundColor: Colors.grey.shade700,
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _overviewCustomContainer('$weight kgs', 'Weight'),
              _overviewCustomContainer('$age years', 'Age'),
              _overviewCustomContainer('$height cms', 'Height'),
            ],
          ),
        ),
      ],
    );
  }
}

class ProfileBackgroundShape extends ShapeBorder {
  const ProfileBackgroundShape({this.y = 60});
  final double y;

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.zero;

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    final path = Path()
      ..moveTo(rect.left, rect.top)
      ..lineTo(rect.right, rect.top)
      ..lineTo(rect.right, rect.bottom - y)
      ..quadraticBezierTo(
        rect.width / 2,
        rect.bottom + y,
        rect.left,
        rect.bottom - y,
      )
      ..close();

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

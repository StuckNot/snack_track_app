import 'package:flutter/material.dart';
import 'package:scanner/src/presentation/camera_screen.dart';
import 'package:scanner/l10n/l10n.dart';

/// {@template scanner}
/// A Flutter module for scanning purpose.
/// {@endtemplate}
class ScannerScreen extends StatelessWidget {
  /// {@macro scanner}
  const ScannerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      backgroundColor: Colors.black54,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CameraScreen()),
          );
        },
        backgroundColor: Colors.amber,
        shape: const CircleBorder(),
        child: const Icon(Icons.arrow_forward,
        color: Colors.black,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(horizontal: 24),
            height: MediaQuery.of(context).size.height / 2,
            decoration: const ShapeDecoration(
              color: Colors.white ,
              shape: GetStartedShape(),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  l10n.getStarted,
                  style: TextStyle(fontSize: 36),
                ),
                Text(
                  l10n.takeHealthIntoYourOwnHands,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// {@template get_started_shape}
/// A custom shape for the "Get Started" screen.
/// {@endtemplate}
class GetStartedShape extends ShapeBorder {
  /// {@macro get_started_shape}
  const GetStartedShape();
  final double borderRadius = 60;

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.zero;

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    final path = Path();
    const halfWidth = 12.5;
    final oneThirdHeight = rect.height / 3;

    // Start at the top-left corner of the rectangle.
    path
      ..moveTo(rect.left, rect.top)
      // Draw a line to a point slightly to the right and down,
      // creating the top-left curve's starting point.
      ..lineTo(rect.left, rect.top + oneThirdHeight - borderRadius)
      // Draw a quadratic Bezier curve to create the rounded top-left corner.
      // The control point is at (rect.left + halfWidth, rect.top + oneThirdHeight),
      // and the end point is at (rect.left + halfWidth + borderRadius, rect.top + oneThirdHeight).
      ..quadraticBezierTo(
        rect.left + halfWidth,
        rect.top + oneThirdHeight,
        rect.left + halfWidth + borderRadius,
        rect.top + oneThirdHeight,
      )
      // Draw a horizontal line to the starting point of the top-right curve.
      ..lineTo(rect.right - borderRadius, rect.top + oneThirdHeight)
      // Draw a quadratic Bezier curve to create the rounded top-right corner.
      // The control point is at (rect.right, rect.top + oneThirdHeight),
      // and the end point is at (rect.right, rect.top + oneThirdHeight + borderRadius).
      ..quadraticBezierTo(
        rect.right,
        rect.top + oneThirdHeight,
        rect.right,
        rect.top + oneThirdHeight + borderRadius,
      )
      // Draw a vertical line to the bottom-right corner of the rectangle.
      ..lineTo(rect.right, rect.bottom)
      // Draw a horizontal line to the bottom-left corner of the rectangle.
      ..lineTo(rect.left, rect.bottom)
      // Draw a vertical line back to the top-left corner of the rectangle.
      ..lineTo(rect.left, rect.top)
      // Close the path to complete the shape.
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

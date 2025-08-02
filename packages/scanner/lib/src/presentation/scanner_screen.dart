import 'package:flutter/material.dart';

/// {@template scanner}
/// A Flutter module for scanning purpose.
/// {@endtemplate}
class ScannerScreen extends StatelessWidget{
  /// {@macro scanner}
  const ScannerScreen();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('Scanner')),
    );
  }
}

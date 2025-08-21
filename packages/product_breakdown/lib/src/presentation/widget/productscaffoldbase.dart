import 'package:flutter/material.dart';

class ProductScaffoldBase extends StatelessWidget {
  final Image image;
  final Widget Function(ScrollController) child;
  const ProductScaffoldBase({
    super.key,
    required this.image,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [

          Positioned.fill(
            child: ColoredBox(
              color: Colors.grey,
              child: Padding(
                padding: const EdgeInsets.all(60),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: SizedBox(
                    height: 250,
                    width: 250,
                    child: image,
                  ),
                ),
              ),
            ),
          ),

          Positioned(
            top: 60.0,
            left: 16.0,
            child: FloatingActionButton(
              onPressed: () {},
              mini: true,
              backgroundColor: Colors.white,
              child: const Icon(Icons.arrow_back, color: Colors.black),
            ),
          ),

          DraggableScrollableSheet(
            initialChildSize: 0.7,
            minChildSize: 0.7,
            maxChildSize: 0.9,
            builder: (context, scrollController) {
              return Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
                ),
                child: child(scrollController),
              );
            },
          ),
        ],
      ),
    );
  }
}

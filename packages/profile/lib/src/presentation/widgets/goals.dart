import 'package:flutter/material.dart';

class Goals extends StatelessWidget {
  const Goals({super.key});

  Widget CustomContainer(String text, String description) {
    return Container(
      height: 120,
      width: 160,
      decoration: BoxDecoration(
        boxShadow: [BoxShadow(color: Colors.grey.shade300, blurRadius: 10)],
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(
              Icons.circle_outlined,
              color: Colors.blueAccent,
            ),
            Text(
              text,
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
            Text(
              description,
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Goals',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
          SingleChildScrollView(
            padding: const EdgeInsets.all(8),
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomContainer('78 Kgs', 'Weight Goals'),
                const SizedBox(
                  width: 8,
                ),
                CustomContainer('10000 Steps', 'Steps Goal'),
                const SizedBox(
                  width: 8,
                ),
                CustomContainer('2000 Calories', 'Calories Goal'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

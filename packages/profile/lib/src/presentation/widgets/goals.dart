import 'package:flutter/material.dart';
import 'package:profile/src/presentation/widgets/add_goals.dart';

class Goals extends StatelessWidget {
  const Goals({super.key});

  Widget goalsCustomContainer(String text, String description, Color color) {
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
            Icon(
              Icons.circle_outlined,
              color: color,
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
          Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Goals',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet<void>(
                      showDragHandle: true,
                      isDismissible: false,
                      enableDrag: false,
                      context: context,
                      builder: (BuildContext context) {
                        return  const AddGoals();
                      },
                    );
                  },
                  child: const Row(
                    children: [
                      Text(
                        'Add Goals',
                        style: TextStyle(color: Colors.deepOrangeAccent),
                      ),
                      Icon(
                        Icons.add,
                        color: Colors.deepOrangeAccent,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SingleChildScrollView(
            padding: const EdgeInsets.all(8),
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                goalsCustomContainer(
                  '78 Kgs',
                  'Weight Goals',
                  Colors.blueAccent,
                ),
                const SizedBox(
                  width: 8,
                ),
                goalsCustomContainer(
                  '10000 Steps',
                  'Steps Goal',
                  Colors.blueAccent,
                ),
                const SizedBox(
                  width: 8,
                ),
                goalsCustomContainer(
                  '2000 Calories',
                  'Calories Goal',
                  Colors.blueAccent,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

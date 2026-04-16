import 'package:flutter/material.dart';

class AddGoals extends StatelessWidget {
  const AddGoals({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Center(
            child: Text(
              'Add Goal',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.deepOrangeAccent,
              ),
            ),
          ),
          const SizedBox(height: 20),
          const Text('Goal Type'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ChoiceChip(
                label: const Text('Nutrition'),
                selected: false,
                onSelected: (_) {},
              ),
              ChoiceChip(
                label: const Text('Weight'),
                selected: false,
                onSelected: (_) {},
              ),
              ChoiceChip(
                label: const Text('Fitness'),
                selected: false,
                onSelected: (_) {},
              ),
              ChoiceChip(
                label: const Text('Custom'),
                selected: false,
                onSelected: (_) {},
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Text('Goal Title'),
          const TextField(
            decoration: InputDecoration(
              hintText: 'e.g. Drink more water',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16),
          const Text('Target'),
          Row(
            children: [
              const Expanded(
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'Value',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              DropdownButton<String>(
                value: 'ml',
                items: ['ml', 'g', 'kcal', 'steps']
                    .map(
                      (unit) =>
                          DropdownMenuItem(value: unit, child: Text(unit)),
                    )
                    .toList(),
                onChanged: (_) {},
              ),
            ],
          ),
          const SizedBox(height: 26),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Cancel'),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text('Save Goal'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

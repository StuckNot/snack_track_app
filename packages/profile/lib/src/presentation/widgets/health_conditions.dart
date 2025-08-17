import 'package:flutter/material.dart';
import 'package:profile/src/presentation/widgets/goals.dart';

class HealthConditions extends StatelessWidget {
  final List<String>? healthConditions;
  HealthConditions({super.key, this.healthConditions});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          const Row(
            children: [
              Padding(
                padding: EdgeInsets.all(8),
                child: Text(
                  'Health Conditions',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 120,
            child: ListView.builder(
              padding: const EdgeInsets.all(8),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => Row(
                children: [
                  const Goals().goalsCustomContainer(
                    healthConditions![index],
                    '',
                    Colors.red,
                  ),
                ],
              ),
              itemCount: healthConditions?.length ?? 0,
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:product_breakdown/src/Domain/entities/nutrient_model.dart';

class NutrientsList extends StatelessWidget {
  const NutrientsList({super.key,required this.nutrients});
  final List<NutrientData> nutrients;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          nutrients.length,
              (index) {
            final nutrient = nutrients[index];
            return Padding(
              padding: const EdgeInsets.only(right: 12.0),
              child: Column(
                children: [
                  Container(
                    width: 100,
                    height: 120,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.grey)
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          nutrient.icon,
                          size: 24,
                          color: Colors.black54,
                        ),
                        const SizedBox(height: 10),
                        FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            nutrient.value,
                            style: const TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10,),
                  Text(
                    nutrient.label,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
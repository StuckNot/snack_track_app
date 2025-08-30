import 'package:flutter/material.dart';
import 'package:product_breakdown/src/Domain/entities/ingredient_model.dart';

class IngredientList extends StatelessWidget {
  const IngredientList({super.key,required this.ingredients});

  final List<Ingredient> ingredients;

  @override
  Widget build(BuildContext context) {
    return
       SingleChildScrollView(
         child: Column(
           children:
             List.generate(
                ingredients.length,
                (index) {
                  final ingredient = ingredients[index];
                  return Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        Expanded(flex:1,child: Text('◉',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black45),)),
                        Expanded(
                          flex: 10,
                          child: Text(
                            ' ${ingredient.name}',
                            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                        ),
                        SizedBox(height: 10,),
                        Expanded(
                          flex: 10,
                          child: Text(
                            ingredient.quantity,
                            textAlign: TextAlign.end,
                            style: const TextStyle(fontSize: 16, color: Colors.black54),
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
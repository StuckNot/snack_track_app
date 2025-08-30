import 'package:flutter/material.dart';
import 'package:product_breakdown/l10n/l10n.dart';
import 'package:product_breakdown/src/Domain/entities/ingredient_model.dart';
import 'package:product_breakdown/src/Domain/entities/nutrient_model.dart';
import 'package:product_breakdown/src/presentation/widget/ingredient_List.dart';
import 'package:product_breakdown/src/presentation/widget/nutrients_List.dart';

class ProductBreakdownView extends StatelessWidget {
  const ProductBreakdownView({
    required this.scrollController,
    required this.nutrients,
    required this.ingredients,
    super.key,
  });
  final ScrollController scrollController;
  final List<NutrientData> nutrients;
  final List<Ingredient> ingredients;

  @override
  Widget build(BuildContext context) {
    final l10n=context.l10n;
    return Padding(
      padding: const EdgeInsets.all(25),
      child: Stack(
        children: [
          SingleChildScrollView(
            controller: scrollController,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    height: 5,
                    width: 70,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(2.5),
                    ),
                  ),
                ),
                 Flexible(
                  child: Text(
                    l10n.miniSamosa,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 35,
                    ),
                  ),
                ),
                SizedBox(height:10),
                Flexible(
                  child: Text(
                    l10n.miniSamosaDesc,
                    style: const TextStyle(fontSize: 16, color: Colors.black45),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                NutrientsList(nutrients: nutrients),
                const SizedBox(
                  height: 45,
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 11,
                      child: Text(
                        l10n.ingredients,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 10,
                      child: Text(
                        '${ingredients.length} ${l10n.items}',
                        textAlign: TextAlign.end,
                        style: const TextStyle(
                          fontSize: 24,
                          color: Colors.black45,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                IngredientList(ingredients: ingredients),
              ],
            ),
          ),
          Positioned(
            bottom: 16.0,
            right: 16.0,
            child: FloatingActionButton(
              onPressed: () {},
              backgroundColor: Colors.grey,
              child: const Icon(
                Icons.download,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

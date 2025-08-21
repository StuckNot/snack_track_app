import 'package:flutter/material.dart';
import 'package:product_breakdown/l10n/l10n.dart';
import 'package:product_breakdown/src/Domain/entities/ingredient_model.dart';
import 'package:product_breakdown/src/Domain/entities/nutrient_model.dart';
import 'package:product_breakdown/src/presentation/view/product_breakdown_view.dart';
import 'package:product_breakdown/src/presentation/widget/productscaffoldbase.dart';

class ProductBreakdownScreen extends StatefulWidget {
  const ProductBreakdownScreen({super.key});

  @override
  State<ProductBreakdownScreen> createState() => _ProductBreakdownScreenState();
}

class _ProductBreakdownScreenState extends State<ProductBreakdownScreen> {
  late List<NutrientData> nutrients;
  late List<Ingredient> ingredients;
  void _initializeData() {
    final l10n = context.l10n;
    nutrients = [
      NutrientData(label: l10n.calories, value: l10n.miniSamosaCalories, icon: Icons.local_fire_department),
      NutrientData(label: l10n.fat, value: l10n.miniSamosaFat, icon: Icons.oil_barrel),
      NutrientData(label: l10n.protein, value: l10n.miniSamosaProtein, icon: Icons.fastfood),
      NutrientData(label: l10n.carbs, value: l10n.miniSamosaCarbs, icon: Icons.rice_bowl),
      NutrientData(label: l10n.sugar, value: l10n.miniSamosaSugar, icon: Icons.bakery_dining),
      NutrientData(label: l10n.fibre, value: l10n.miniSamosaFiber, icon: Icons.grass),
      NutrientData(label: l10n.vitamins, value: l10n.miniSamosaVitaminC, icon: Icons.medical_services),
      NutrientData(label: l10n.minerals, value: l10n.miniSamosaZinc, icon: Icons.diamond),
      NutrientData(label: l10n.sodium, value: l10n.miniSamosaSodium, icon: Icons.cookie),
      NutrientData(label: l10n.calcium, value: l10n.miniSamosaCalcium, icon: Icons.local_drink),
      NutrientData(label: l10n.iron, value: l10n.miniSamosaIron, icon: Icons.hardware),
      NutrientData(label: l10n.potassium, value: l10n.miniSamosaPotassium, icon: Icons.scatter_plot),
      NutrientData(label: l10n.cholesterol, value: l10n.miniSamosaCholesterol, icon: Icons.monitor_heart),
      NutrientData(label: l10n.folate, value: l10n.miniSamosaVitaminC, icon: Icons.spa),
      NutrientData(label: l10n.magnesium, value: l10n.miniSamosaMagnesium, icon: Icons.bolt),
    ];
    ingredients = [
      Ingredient(name: l10n.maida, quantity: l10n.oneCup),
      Ingredient(name: l10n.gheeOrOil, quantity: l10n.twoTbsp),
      Ingredient(name: l10n.salt, quantity: l10n.toTaste),
      Ingredient(name: l10n.boiledPotatoes, quantity: l10n.twoMedium),
      Ingredient(name: l10n.greenPeas, quantity: l10n.quarterCup),
      Ingredient(name: l10n.gingerGarlicPaste, quantity: l10n.oneTsp),
      Ingredient(name: l10n.greenChilies, quantity: l10n.twoChopped),
      Ingredient(name: l10n.corianderPowder, quantity: l10n.oneTsp),
      Ingredient(name: l10n.cuminPowder, quantity: l10n.halfTsp),
      Ingredient(name: l10n.garamMasala, quantity: l10n.halfTsp),
      Ingredient(name: l10n.amchur, quantity: l10n.halfTsp),
      Ingredient(name: l10n.corianderLeaves, quantity: l10n.twoTbspChopped),
    ];
  }
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _initializeData();
  }
  late ScrollController scrollController;
  @override
  void initState() {
    super.initState();
    scrollController=ScrollController();
  }
  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return ProductScaffoldBase(
        image: Image.asset('packages/product_breakdown/assets/images/miniSamose.png'),
        child: (scrollController){
          return ProductBreakdownView(
            scrollController: scrollController,
            nutrients: nutrients, ingredients:ingredients ,);
        },);
  }
}

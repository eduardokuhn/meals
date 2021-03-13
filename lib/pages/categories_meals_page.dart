import 'package:flutter/material.dart';
import 'package:meals/components/meal_item.dart';
import 'package:meals/models/category.dart';
import 'package:meals/models/meal.dart';

class CategoriesMealsPage extends StatelessWidget {
  final List<Meal> meals;

  CategoriesMealsPage(this.meals);

  @override
  Widget build(BuildContext context) {
    final _category = ModalRoute.of(context)!.settings.arguments as Category;

    final _categoryMeals = meals.where((meal) {
      return meal.categories.contains(_category.id);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(_category.title),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: _categoryMeals.length,
          itemBuilder: (context, index) {
            return MealItem(_categoryMeals[index]);
          },
        ),
      ),
    );
  }
}

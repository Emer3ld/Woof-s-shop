import 'package:flutter/material.dart';
import '../constants/const.dart';
import '../models/meal.dart';

class MealTile extends StatelessWidget {
  final Meal meal;
  final Widget icon;
  void Function()? onTap;
  MealTile({
    super.key,
    required this.meal,
    required this.onTap,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: lightBackgroundColor,
        ),
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: ListTile(
          leading: Image.asset(meal.imagePath),
          title: Text(
            meal.name,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Colors.grey[800],
            ),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 90.0),
            child: Text('\£${meal.price}'),
          ),
          trailing: Padding(
            padding: EdgeInsets.only(right: 10.0),
            child: icon,
          ),
        ),
      ),
    );
  }
}

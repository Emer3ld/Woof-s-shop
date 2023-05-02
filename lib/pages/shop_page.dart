import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/meal_tile.dart';
import '../models/meal.dart';
import '../models/shop.dart';
import 'order_page.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {

  void goToOrderPage(Meal meal) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => OrderPage(
          meal: meal,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DogFoodShop>(
      builder: (context, value, child) => Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Woofaliscious Meals",
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 25),
            Expanded(
              child: ListView.builder(
                itemCount: value.shop.length,
                itemBuilder: (context, index) {
                  Meal individualMeal = value.shop[index];
                  return MealTile(
                    meal: individualMeal,
                    onTap: () => goToOrderPage(individualMeal),
                    icon: const Icon(Icons.arrow_forward),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/meal_tile.dart';
import '../components/my_button.dart';
import '../models/meal.dart';
import '../models/shop.dart';



//Basket
//User can edit their basket or choose to pay



class BasketPage extends StatefulWidget {
  const BasketPage({super.key});

  @override
  State<BasketPage> createState() => _BasketPageState();
}

class _BasketPageState extends State<BasketPage> {
  // remove meal from basket
  void removeFromBasket(Meal meal) {
    Provider.of<DogFoodShop>(context, listen: false).removeFromBasket(meal);
  }

  // pay now button tapped
  void payNow() {

  //  add payment services in this method


  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DogFoodShop>(
      builder: (context, value, child) => Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // heading
            const Text(
              'Your Basket',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),

            const SizedBox(height: 25),

            // list of basket items
            Expanded(
                child: value.basket.isEmpty
                    ? Center(
                        child: Text(
                          'Empty Basket..',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    : ListView.builder(
                        itemCount: value.basket.length,
                        itemBuilder: (context, index) {
                          // get individual meal from basket list
                          Meal individualMeal = value.basket[index];

                          // return as a list tile
                          return MealTile(
                              meal: individualMeal,
                              onTap: () => removeFromBasket(individualMeal),
                              icon: const Icon(Icons.delete));
                        },
                      )),

            // pay button
            MyButton(text: "Pay now", onTap: payNow)
          ],
        ),
      ),
    );
  }
}

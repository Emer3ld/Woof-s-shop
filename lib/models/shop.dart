import 'package:flutter/material.dart';
import 'meal.dart';

class DogFoodShop extends ChangeNotifier {
  // list of meals for sale
  final List<Meal> _shop = [
    // Fish based meal
    Meal(
      name: "Pawsitvely Fish \450g",
      price: "5.40",
      weight: "",
      imagePath: "lib/images/seaweed:fish.png",
    ),

    // Game meal
    Meal(
      name: "Woofs Wild Game 450g",
      price: "4.85",
      weight: "",
      imagePath: "lib/images/grouse2.png",
    ),

    // Chicken meal
    Meal(
      name: "Clucking Good Kibble 450g",
      price: "5.25",
      weight: "",
      imagePath: "lib/images/hen4.png",
    ),

    // Pork meal
    Meal(
      name: "Swine & Dine       450g",
      price: "£4.35",
      weight: "",
      imagePath: "lib/images/Modern Pig .png",
    ),

    // Beef Meal
    Meal(
      name: "Cattle Call Cuisine    450g",
      price: "£5.70",
      weight: "",
      imagePath: "lib/images/cow 3.png",
    ),
  ];

  // list of meals in user basket
  List<Meal> _userBasket = [];

  // get meal for sale
  List<Meal> get shop => _shop;

  // get meal in basket
  List<Meal> get basket => _userBasket;

  // add meal to basket
  void addToBasket(Meal meal) {
    _userBasket.add(meal);
    notifyListeners();
  }

  // remove meal from basket
  void removeFromBasket(Meal meal) {
    _userBasket.remove(meal);
    notifyListeners();
  }
}

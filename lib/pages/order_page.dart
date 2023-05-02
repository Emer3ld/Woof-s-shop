import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/my_button.dart';
import '../constants/const.dart';
import '../models/meal.dart';
import '../models/shop.dart';

class OrderPage extends StatefulWidget {
  final Meal meal;
  const OrderPage({super.key, required this.meal});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  // customise vegetables
  double ruffageValue = 0.5;
  void customizeRuffage(double newValue) {
    setState(() {
      ruffageValue = newValue;
    });
  }

  // customise lean or fatty cutts
  double cuttsValue = 0.5;
  void customizeCutts(double newValue) {
    setState(() {
      cuttsValue = newValue;
    });
  }

  // customise vitamins & minerals
  double vitValue = 0.5;
  void customizeVitamins(double newValue) {
    setState(() {
      vitValue = newValue;
    });
  }
  // customise weight value
  double weightValue = 0.5;
  void customizeWeight(double newValue) {
    setState(() {
      weightValue = newValue;
    });
  }
  // add to basket
  void addToBasket(Meal meal) {
    // add to basket first
    Provider.of<DogFoodShop>(context, listen: false).addToBasket(meal);

    // direct user back to shop page
    Navigator.pop(context);

    // let user know it has been successfully added
    showDialog(
      context: context,
      builder: (context) => const AlertDialog(
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 18),
        title: Text(
          'Added to basket!',
        ),
        backgroundColor: Colors.pink,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: backgroundColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 25, right: 25, bottom: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // milk tea image
              Image.asset(
                widget.meal.imagePath,
                height: 250,
              ),

              const SizedBox(height: 50),

              // options to customise meal
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Column(
                  children: [
                    // sweetness
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 100,
                          child: Text(
                            "Ruffage: 1 portion",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Slider(
                            value: ruffageValue,
                            divisions: 4,
                            label: ruffageValue.toString(),
                            onChanged: (value) => customizeRuffage(value),
                          ),
                        ),
                      ],
                    ),

                    // ice
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 100,
                          child: Text(
                            "Lean - Fatty cuts",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Slider(
                            value: cuttsValue,
                            divisions: 4,
                            label: cuttsValue.toString(),
                            onChanged: (value) => customizeCutts(value),
                          ),
                        ),
                      ],
                    ),

                    // pearls
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 100,
                          child: Text(
                            "Vitamins & Minerals-fortied",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Slider(
                            value: vitValue,
                            divisions: 4,
                            label: vitValue.toString(),
                            onChanged: (value) => customizeVitamins(value),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // add to basket button
              MyButton(
                text: 'Add to basket',
                onTap: () => addToBasket(widget.meal),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

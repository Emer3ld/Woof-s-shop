import 'package:flutter/material.dart';
import '../constants/const.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: const Text('About Us'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'lib/images/woofs the way bout us.png',
                height: 330,
              ),
              Padding(
                padding: const EdgeInsets.all(40.0), // set desired padding
                child: Text(
                  "Welcome to Woofs the dog food customisation app! "
                      "We know that every dog is unique and has specific dietary needs, "
                      "which is why we have created a platform that allows you to customize "
                      "your dog's meals with ease. Our app lets you choose from a variety of "
                      "high-quality meats, vegetables, and grains, and adjust portion sizes "
                      "to fit your dog's individual needs. Plus, with our convenient delivery service, "
                      "you'll never have to worry about running out of food again. Give your dog "
                      "the nutrition they deserve with our custom dog food app.",
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        )
    );
  }
}

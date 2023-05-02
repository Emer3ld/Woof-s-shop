import 'package:flutter/material.dart';
import '../components/bottom_bar.dart';
import '../components/my_drawer.dart';
import '../constants/const.dart';
import 'basket_page.dart';
import 'shop_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // navigate bottom bar
  int _selectedIndex = 0;
  void navigateBottomBar(int newIndex) {
    setState(() {
      _selectedIndex = newIndex;
    });
  }

  // pages
  final List<Widget> _pages = [
    // shop page
    const ShopPage(),

    // basket
    const BasketPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: backgroundColor,
      bottomNavigationBar: MyBottomBar(
        onTabChange: (index) => navigateBottomBar(index),
      ),
      drawer: MyDrawer(),
      body: _pages[_selectedIndex],
    );
  }
}

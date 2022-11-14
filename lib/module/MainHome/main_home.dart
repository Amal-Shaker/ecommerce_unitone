import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'all_product_controllor.dart';
import 'MainHomeScreen/cart_screen.dart';
import 'MainHomeScreen/favorite_screen.dart';
import 'MainHomeScreen/Home/home.dart';

class MainHomeScreen extends StatefulWidget {
  MainHomeScreen({super.key});
  static List<Widget> widgetOption = [Home(), FaviroteScreen(), CartScreen()];
  AllProductControllor allProductControllor = Get.put(AllProductControllor());

  @override
  State<MainHomeScreen> createState() => _MainHomeScreenState();
}

class _MainHomeScreenState extends State<MainHomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      //print(_selectedIndex);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MainHomeScreen.widgetOption.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex, //New
        onTap: _onItemTapped,
        unselectedLabelStyle: const TextStyle(fontSize: 13),
        selectedItemColor: const Color.fromARGB(255, 251, 147, 182),
        //const Color(0xff121311),
        unselectedItemColor: const Color(0xff95989C),
        showSelectedLabels: true,
        showUnselectedLabels: true,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
        ],
      ),
    );
  }
}

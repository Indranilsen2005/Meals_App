import 'package:flutter/material.dart';
import 'package:food_app/screens/categories.dart';
import 'package:food_app/screens/meals.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int setPageIndex = 0;

  void _selectTab(int index) {
    setState(() {
      setPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var pageTitle = 'Categories';
    Widget pageContent = const CategoriesScreen();

    if (setPageIndex == 1) {
      pageTitle = 'Favourite Meals';
      pageContent = const MealsScreen(meals: []);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(pageTitle),
      ),
      body: pageContent,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: setPageIndex,
        onTap: _selectTab,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.set_meal,
              ),
              label: 'Categories'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.star,
              ),
              label: 'Favorites'),
        ],
      ),
    );
  }
}

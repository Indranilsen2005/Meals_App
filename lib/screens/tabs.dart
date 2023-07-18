import 'package:flutter/material.dart';
import 'package:food_app/models/meal.dart';
import 'package:food_app/screens/categories.dart';
import 'package:food_app/screens/meals.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int setPageIndex = 0;
  final List<Meal> _favouriteMeals = [];

  void _selectTab(int index) {
    setState(() {
      setPageIndex = index;
    });
  }

  void _showMessageInfo(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  void _toggleFavouriteMealButton(Meal meal) {
    final isExisting = _favouriteMeals.contains(meal);

    if (isExisting) {
      setState(() {
        _favouriteMeals.remove(meal);
      });
      _showMessageInfo('Meal removed from favourite list!');
    } else {
      setState(() {
        _favouriteMeals.add(meal);
      });
      _showMessageInfo('Meal added to favourite list!');
    }
  }

  @override
  Widget build(BuildContext context) {
    var pageTitle = 'Categories';
    Widget pageContent = CategoriesScreen(
      onToggleFavouriteMealButton: _toggleFavouriteMealButton,
    );

    if (setPageIndex == 1) {
      pageTitle = 'Favourite Meals';
      pageContent = MealsScreen(
        meals: _favouriteMeals,
        onToggleFavouriteMealButton: _toggleFavouriteMealButton,
      );
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

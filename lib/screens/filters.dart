import 'package:flutter/material.dart';

enum Filter {
  glutenFree,
  lactoseFree,
  vegetarian,
  vegan,
}

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key, required this.currrentFilters});

  final Map<Filter, bool> currrentFilters;

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _isGlutenFreeFilterSet = false;
  var _isLactoseFreeFilterSet = false;
  var _isVegetarianFilterSet = false;
  var _isVeganFilterSet = false;

  @override
  void initState() {
    super.initState();
    _isGlutenFreeFilterSet = widget.currrentFilters[Filter.glutenFree]!;
    _isLactoseFreeFilterSet = widget.currrentFilters[Filter.lactoseFree]!;
    _isVegetarianFilterSet = widget.currrentFilters[Filter.vegetarian]!;
    _isVeganFilterSet = widget.currrentFilters[Filter.vegan]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      body: WillPopScope(
        onWillPop: () async {
          Navigator.of(context).pop(
            {
              Filter.glutenFree: _isGlutenFreeFilterSet,
              Filter.lactoseFree: _isLactoseFreeFilterSet,
              Filter.vegetarian: _isVegetarianFilterSet,
              Filter.vegan: _isVeganFilterSet,
            },
          );
          return false;
        },
        child: Column(
          children: [
            SwitchListTile(
              value: _isGlutenFreeFilterSet,
              onChanged: (isChecked) {
                setState(() {
                  _isGlutenFreeFilterSet = isChecked;
                });
              },
              title: Text(
                'Gluten-free',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              subtitle: Text(
                'Only show gluten-free meals.',
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 33, right: 22),
            ),
            SwitchListTile(
              value: _isLactoseFreeFilterSet,
              onChanged: (isChecked) {
                setState(() {
                  _isLactoseFreeFilterSet = isChecked;
                });
              },
              title: Text(
                'Lactose-free',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              subtitle: Text(
                'Only show lactose-free meals.',
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 33, right: 22),
            ),
            SwitchListTile(
              value: _isVegetarianFilterSet,
              onChanged: (isChecked) {
                setState(() {
                  _isVegetarianFilterSet = isChecked;
                });
              },
              title: Text(
                'Vegetarian',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              subtitle: Text(
                'Only show vegetarian meals.',
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 33, right: 22),
            ),
            SwitchListTile(
              value: _isVeganFilterSet,
              onChanged: (isChecked) {
                setState(() {
                  _isVeganFilterSet = isChecked;
                });
              },
              title: Text(
                'Vegan',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              subtitle: Text(
                'Only show vegan meals.',
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 33, right: 22),
            ),
          ],
        ),
      ),
    );
  }
}

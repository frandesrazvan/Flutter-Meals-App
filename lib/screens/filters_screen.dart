import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';

  final Function saveFilters;
  final Map<String, bool> currentFilters;

  FiltersScreen(this.currentFilters, this.saveFilters);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFree = false; // sau var daca nu merge bine
  var _vegetarian = false;
  var _vegan = false;
  var _lactoseFree = false;

  @override
  initState() {
    _glutenFree = widget.currentFilters['gluten']!;
    _lactoseFree = widget.currentFilters['lactose']!;
    _vegetarian = widget.currentFilters['vegetarian']!;
    _vegan = widget.currentFilters['vegan']!;
    super.initState();
  }

  Widget _buildSwitchListTile(String title) {
    switch (title) {
      case 'Gluten-free':
        return SwitchListTile(
            title: Text(title),
            subtitle: const Text('Only include gluten-free meals'),
            value: _glutenFree,
            onChanged: (newValue) {
              setState(() {
                _glutenFree = newValue;
              });
            });
      case 'Vegetarian':
        return SwitchListTile(
            title: Text(title),
            subtitle: const Text('Only include vegetarian meals'),
            value: _vegetarian,
            onChanged: (newValue) {
              setState(() {
                _vegetarian = newValue;
              });
            });
      case 'Vegan':
        return SwitchListTile(
            title: Text(title),
            subtitle: const Text('Only include vegan meals'),
            value: _vegan,
            onChanged: (newValue) {
              setState(() {
                _vegan = newValue;
              });
            });
      case 'Lactose-free':
        return SwitchListTile(
            title: Text(title),
            subtitle: const Text('Only include lactose-free meals'),
            value: _lactoseFree,
            onChanged: (newValue) {
              setState(() {
                _lactoseFree = newValue;
              });
            });
      default:
        Container();

        return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Filters',
          ),
          actions: [
            IconButton(
                onPressed: () {
                  final selectedFilters = {
                    'gluten': _glutenFree,
                    'lactose': _lactoseFree,
                    'vegetarian': _vegetarian,
                    'vegan': _vegan
                  };

                  widget.saveFilters(selectedFilters);
                  Navigator.of(context).pushNamed('/');
                },
                icon: Icon(Icons.save))
          ],
        ),
        drawer: MainDrawer(),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                'Adjust your meal selection',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            Expanded(
                child: ListView(
              children: [
                _buildSwitchListTile('Gluten-free'),
                _buildSwitchListTile('Vegetarian'),
                _buildSwitchListTile('Vegan'),
                _buildSwitchListTile('Lactose-free')
              ],
            ))
          ],
        ));
  }
}

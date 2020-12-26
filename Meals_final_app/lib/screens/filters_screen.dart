import 'package:flutter/material.dart';

import './drawer_screen.dart';

class FiltersScreen extends StatefulWidget {
  static const routName = '/FilterScreen';
  final Function setFilter;
  Map<String, bool> currentFilters;

  FiltersScreen(this.setFilter, this.currentFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _isGlutenFree = false;
  bool _isVegan = false;
  bool _isVegetarian = false;
  bool _isLactoseFree = false;

  @override
  initState() {
    _isGlutenFree = widget.currentFilters['gluten'];
    _isLactoseFree = widget.currentFilters['lactose'];
    _isVegan = widget.currentFilters['vegan'];
    _isVegetarian = widget.currentFilters['vegeterian'];
    super.initState();
  }

  Widget switchList(
      String title, String subtitle, bool currentvalue, Function click) {
    return SwitchListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        value: currentvalue,
        onChanged: click);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favourites'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final selectedFilters = {
                'gluten': _isGlutenFree,
                'lactose': _isLactoseFree,
                'vegan': _isVegan,
                'vegeterian': _isVegetarian,
              };
              widget.setFilter(selectedFilters);
            },
          )
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              "Adjust your Meal Selection",
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              switchList('Gluten-Free', 'Only include Gluten Free Meals',
                  _isGlutenFree, (value) {
                setState(() {
                  _isGlutenFree = value;
                });
              }),
              switchList('Lactose-Free', 'Only include Lactose Free Meals',
                  _isLactoseFree, (value) {
                setState(() {
                  _isLactoseFree = value;
                });
              }),
              switchList(
                  'Vegeterian', 'Only include Vegeterian Meals', _isVegetarian,
                  (value) {
                setState(() {
                  _isVegetarian = value;
                });
              }),
              switchList('Vegan', 'Only include Vegan Meals', _isVegan,
                  (value) {
                setState(() {
                  _isVegan = value;
                });
              }),
            ],
          )),
        ],
      ),
      drawer: DrawerScreen(),
    );
  }
}

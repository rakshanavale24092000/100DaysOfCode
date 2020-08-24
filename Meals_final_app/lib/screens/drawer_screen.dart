import 'package:flutter/material.dart';
import './filters_screen.dart';

class DrawerScreen extends StatelessWidget {
  Widget listTile(String title, IconData icon, Function tap) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: TextStyle(
            fontFamily: 'RobotoCondensed',
            fontSize: 20,
            fontWeight: FontWeight.w800),
      ),
      onTap: tap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
              height: 120,
              width: double.infinity,
              alignment: Alignment.centerLeft,
              color: Theme.of(context).accentColor,
              child: Padding(
                padding: EdgeInsets.only(left: 15),
                child: Text(
                  'What\'s Cooking!',
                  style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 26,
                      color: Theme.of(context).primaryColor),
                ),
              )),
          SizedBox(
            height: 20,
          ),
          listTile('Meals', Icons.restaurant, () {
            Navigator.of(context).pushReplacementNamed('/');
          }),
          listTile('Filters', Icons.settings, () {
            Navigator.of(context).pushReplacementNamed(FiltersScreen.routName);
          })
        ],
      ),
    );
  }
}

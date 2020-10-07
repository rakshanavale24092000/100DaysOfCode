import 'package:flutter/material.dart';

class DrawerScreen extends StatelessWidget {
  Widget listTile(String title, IconData icon) {
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
      onTap: () {},
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
          listTile('Meals', Icons.restaurant),
          listTile('Filters', Icons.settings)
        ],
      ),
    );
  }
}

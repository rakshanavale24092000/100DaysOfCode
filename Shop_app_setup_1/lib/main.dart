import 'package:flutter/material.dart';
import './screens/portfolio_overview_screen.dart';

main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: Colors.purple,
          accentColor: Colors.deepOrange,
          fontFamily: 'Lato'),
      home: Portfolio_overview_screen(),
    );
  }
}

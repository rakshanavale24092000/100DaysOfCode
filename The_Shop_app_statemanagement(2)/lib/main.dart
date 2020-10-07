import 'package:flutter/material.dart';
import './screens/portfolio_overview_screen.dart';
import './screens/product_detail.dart';
import './provider/product_provider.dart';
import 'package:provider/provider.dart';

main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProductProvider(),
      child: MaterialApp(
        theme: ThemeData(
            primaryColor: Colors.purple,
            accentColor: Colors.deepOrange,
            fontFamily: 'Lato'),
        home: Portfolio_overview_screen(),
        routes: {
          ProductDetailScreen.routName: (ctx) => ProductDetailScreen(),
        },
      ),
    );
  }
}

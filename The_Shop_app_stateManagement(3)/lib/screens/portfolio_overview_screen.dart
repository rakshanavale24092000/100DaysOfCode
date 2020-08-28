import 'package:flutter/material.dart';
import '../widgets/product_grid.dart';

class Portfolio_overview_screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shop App'),
      
      ),
      
      body: ProductGrid(),
    );
  }
}

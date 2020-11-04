import 'package:flutter/material.dart';
import '../provider/product_provider.dart';
import 'package:provider/provider.dart';
import '../widgets/product_item.dart';

class ProductGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productdata = Provider.of<ProductProvider>(context);
    final products = productdata.items;
    return GridView.builder(
      padding: EdgeInsets.all(10),
      itemCount: products.length,
      itemBuilder: (ctx, index) => ProductItem(
          products[index].id, products[index].title, products[index].imageUrl),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../screens/product_detail.dart';
import 'package:provider/provider.dart';
import '../provider/product.dart';

class ProductItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context);
    return GridTile(
      child: GestureDetector(
        onTap: () {
          Navigator.of(context)
              .pushNamed(ProductDetailScreen.routName, arguments: product.id);
        },
        child: Image.network(
          product.imageUrl,
          fit: BoxFit.cover,
        ),
      ),
      footer: GridTileBar(
        backgroundColor: Colors.black54,
        leading: IconButton(
          icon: Icon(product.isFav ? Icons.favorite : Icons.favorite_border),
          onPressed: () {
            product.toggleFavouriteStatus();
          },
          color: Theme.of(context).accentColor,
        ),
        title: Text(
          product.title,
          textAlign: TextAlign.center,
        ),
        trailing: IconButton(
          icon: Icon(Icons.shopping_cart),
          onPressed: () {},
          color: Theme.of(context).accentColor,
        ),
      ),
    );
  }
}

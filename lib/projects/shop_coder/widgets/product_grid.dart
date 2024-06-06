import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teste/projects/shop_coder/models/product.dart';
import 'package:teste/projects/shop_coder/models/product_list.dart';
import 'package:teste/projects/shop_coder/widgets/product_item.dart';

class ProductGrid extends StatelessWidget {
  const ProductGrid({super.key, required this.showFavorite});

  final bool showFavorite;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductList>(context);
    final List<Product> loadedProduct = showFavorite ? provider.showFavoritesItems : provider.items;
    return GridView.builder(
      itemCount: loadedProduct.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (ctx, index) => ChangeNotifierProvider.value(
        value: loadedProduct[index],
        child: const ProductItem(),
      ),
    );
  }
}

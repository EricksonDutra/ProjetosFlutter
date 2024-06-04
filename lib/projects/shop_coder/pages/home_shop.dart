import 'package:flutter/material.dart';
import 'package:teste/projects/shop_coder/models/product.dart';
import 'package:teste/projects/shop_coder/widgets/product_item.dart';

import '../data/dummy_data.dart';

class HomeShop extends StatelessWidget {
  HomeShop({super.key});

  final List<Product> _loadedProduct = dummyProducts;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Produtos',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 165, 37, 224),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: GridView.builder(
          itemCount: _loadedProduct.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemBuilder: (ctx, index) => ProductItem(
            product: _loadedProduct[index],
          ),
        ),
      ),
    );
  }
}

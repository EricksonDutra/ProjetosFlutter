import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teste/projects/shop_coder/models/cart.dart';
import 'package:teste/projects/shop_coder/widgets/app_drawer.dart';
import 'package:teste/utils/constants.dart';
import 'package:teste/projects/shop_coder/widgets/badge_cart.dart';
import 'package:teste/projects/shop_coder/widgets/product_grid.dart';

// import '../data/dummy_data.dart';

enum FilterOptions {
  favorite,
  all,
}

class HomeShop extends StatefulWidget {
  const HomeShop({super.key});

  @override
  State<HomeShop> createState() => _HomeShopState();
}

class _HomeShopState extends State<HomeShop> {
  bool _showFavorite = false;
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
        actions: [
          Consumer<Cart>(
            child: IconButton(
              icon: const Icon(
                Icons.shopping_cart,
                color: Colors.white,
              ),
              onPressed: () => Navigator.pushNamed(context, AppRoutes.cart),
            ),
            builder: (ctx, cart, child) => BadgeCart(
              value: cart.itemsCount.toString(),
              child: child!,
            ),
          ),
          PopupMenuButton(
            iconColor: Colors.white,
            itemBuilder: (_) => [
              const PopupMenuItem(
                value: FilterOptions.favorite,
                child: Text('Somente favoritos'),
              ),
              const PopupMenuItem(
                value: FilterOptions.all,
                child: Text('Todos'),
              ),
            ],
            onSelected: (value) {
              setState(() {
                if (value == FilterOptions.favorite) {
                  _showFavorite = true;
                } else {
                  _showFavorite = false;
                }
              });
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ProductGrid(
          showFavorite: _showFavorite,
        ),
      ),
      drawer: const AppDrawer(),
    );
  }
}

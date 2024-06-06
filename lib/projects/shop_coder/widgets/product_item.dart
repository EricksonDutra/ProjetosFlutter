import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:teste/projects/shop_coder/models/cart.dart';
import 'package:teste/projects/shop_coder/models/product.dart';
import 'package:teste/utils/constants.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key});

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          leading: Consumer<Product>(
            builder: (ctx, product, _) => IconButton(
              onPressed: () => product.toggleFavorite(),
              icon: const Icon(Icons.favorite),
              color: product.isFavorite ? Colors.deepOrange : Colors.white,
            ),
          ),
          title: Text(
            product.title,
            textAlign: TextAlign.center,
            style: GoogleFonts.lato(),
          ),
          trailing: Consumer<Cart>(
            builder: (ctx, cart, _) => IconButton(
              onPressed: () => cart.addItem(product),
              icon: const Icon(Icons.shopping_cart),
              color: Colors.deepOrange,
            ),
          ),
        ),
        child: InkWell(
          onTap: () => Navigator.pushNamed(
            context,
            AppRoutes.productDetail,
            arguments: product,
          ),
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

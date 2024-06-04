import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:teste/projects/shop_coder/models/product.dart';
import 'package:teste/projects/shop_coder/utils/constants.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.favorite),
            color: Colors.deepOrange,
          ),
          title: Text(
            product.title,
            textAlign: TextAlign.center,
            style: GoogleFonts.lato(),
          ),
          trailing: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.shopping_cart),
            color: Colors.deepOrange,
          ),
        ),
        child: InkWell(
          onTap: () => Navigator.pushNamed(
            context,
            AppRoutes.PRODUCT_DETAIL,
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

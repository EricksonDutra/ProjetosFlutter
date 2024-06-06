import 'package:flutter/material.dart';
import 'package:teste/projects/shop_coder/data/dummy_data.dart';
import 'package:teste/projects/shop_coder/models/product.dart';

class ProductList with ChangeNotifier {
  final List<Product> _items = dummyProducts;

  List<Product> get items => [..._items];
  List<Product> get showFavoritesItems => _items.where((e) => e.isFavorite).toList();

  void addProduct(Product product) {
    _items.add(product);
    notifyListeners();
  }
}


// var _showFavorites = false;

//   List<Product> get items {
//     if (_showFavorites) {
//       return _items.where((e) => e.isFavorite).toList();
//     }

//     return _items;
//   }

//   void showOnlyFavorites() {
//     _showFavorites = true;
//     notifyListeners();
//   }

//   void showAll() {
//     _showFavorites = false;
//     notifyListeners();
//   }

//   void addProduct(Product product) {
//     items.add(product);
//     notifyListeners();
//   }
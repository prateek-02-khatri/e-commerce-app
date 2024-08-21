import 'package:e_commerce_app/models/product_model.dart';
import 'package:flutter/foundation.dart';

class FavoriteProvider with ChangeNotifier {
  final List<Product> _favoriteProducts = [];
  List<Product> get favoriteProducts => _favoriteProducts;

  void addToFavorite(Product product) {
    _favoriteProducts.add(product);
    notifyListeners();
  }

  void removeFromFavorite(Product product) {
    _favoriteProducts.remove(product);
    notifyListeners();
  }
}
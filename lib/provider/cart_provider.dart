import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/product_model.dart';

class CartProvider with ChangeNotifier {

  bool _showPaymentDetails = false;
  bool get showPaymentDetails => _showPaymentDetails;
  void setShowPaymentDetails(bool value) {
    _showPaymentDetails = value;
    notifyListeners();
  }

  final List<Product> _cart = [];
  List<Product> get cart => _cart;

  void addToCart(Product product) {
    _cart.add(product);
    notifyListeners();
  }

  void removeFromCart(int index) {
    _cart[index].quantity = 1;
    _cart.removeAt(index);
    notifyListeners();
  }

  void incrementQuantity(int index) {
    if (_cart[index].quantity < 10) {
      _cart[index].quantity++;
      notifyListeners();
    }
  }

  void decrementQuantity(int index) {
    if (_cart[index].quantity > 1) {
      _cart[index].quantity--;
      notifyListeners();
    }
  }

  double totalAmount() {
    double total = 0;
    for (Product items in _cart) {
      total += items.quantity * items.price;
    }
    return total;
  }

  static CartProvider of(
    BuildContext context,
    {bool listen = true,}
  ) {
    return Provider.of<CartProvider>(context, listen: listen);
  }
}
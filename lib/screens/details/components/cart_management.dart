// cart_model.dart

import 'package:flutter/material.dart';

import '../../../models/product.dart';

class Cart {
  final List<CartItem> items;

  Cart(this.items);

  double get total {
    return items.fold(0, (total, item) => total + item.subtotal);
  }
}

class CartModel extends ChangeNotifier {
  List<CartItem> _items = [];

  List<CartItem> get items => _items;

  // Add a getter named 'cart' here
  Cart get cart => Cart(_items);

  void addToCart(Product product) {
    var existingItemIndex = _items.indexWhere(
      (item) => item.product.id == product.id,
    );

    if (existingItemIndex != -1) {
      // If the product is already in the cart, increase its quantity
      _items[existingItemIndex].incrementQuantity();
    } else {
      // Otherwise, add a new item to the cart
      _items.add(CartItem(product: product));
    }

    // Notify listeners
    notifyListeners();
  }

  void updateQuantity(Product product, int quantity) {
    if (quantity > 0) {
      var existingItem = _items.firstWhere(
        (item) => item.product.id == product.id,
        orElse: () => CartItem(product: product),
      );

      existingItem.quantity = quantity;
      notifyListeners();
    }
  }

  // Method to decrement the quantity
  void decrementQuantity(Product product) {
    var existingItem = _items.firstWhere(
      (item) => item.product.id == product.id,
      orElse: () => CartItem(product: product),
    );

    if (existingItem.quantity > 1) {
      existingItem.quantity--;
      notifyListeners();
    }
  }

  // Method to remove a product from the cart
  void removeFromCart(Product product) {
    var existingItemIndex = _items.indexWhere(
      (item) => item.product.id == product.id,
    );

    if (existingItemIndex != -1) {
      if (_items[existingItemIndex].quantity > 1) {
        // If quantity is greater than 1, decrement the quantity
        _items[existingItemIndex].decrementQuantity();
      } else {
        // If quantity is 1, remove the item from the cart
        _items.removeAt(existingItemIndex);
      }
      notifyListeners();
    }
  }
}

class CartItem {
  final Product product;
  int quantity;

  CartItem({required this.product, this.quantity = 1});

  double get subtotal => product.price! * quantity.toDouble();

  void incrementQuantity() {
    quantity++;
  }

  void decrementQuantity() {
    if (quantity > 0) {
      quantity--;
    }
  }
}

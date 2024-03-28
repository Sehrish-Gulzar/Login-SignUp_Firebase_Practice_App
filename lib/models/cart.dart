// cart_item.dart
import 'package:fire_base_demo/models/product.dart';

class CartItem {
  final Product product;
  int quantity;
  double subtotal;

  CartItem({required this.product, this.quantity = 1})
      : subtotal = (product.price! * quantity).toDouble();
}

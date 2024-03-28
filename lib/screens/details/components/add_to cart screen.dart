import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';
import 'cart_management.dart';

class CartScreen extends StatefulWidget {
  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartModel>(context).cart;

    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cart.items.length,
              itemBuilder: (context, index) {
                final cartItem = cart.items[index];
                final product = cartItem.product;

                return ListTile(
                  leading: Image.asset(
                    product.image!,
                    width: 50,
                    height: 50,
                  ),
                  title: Text(product.title!),
                  subtitle: Text('\$${product.price! * cartItem.quantity}'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.remove),
                        onPressed: () {
                          if (cartItem.quantity > 1) {
                            // Decrease quantity if more than 1
                            cartItem.decrementQuantity();
                            setState(() {}); // Update the UI
                          } else {
                            // Remove product if quantity is 1
                            Provider.of<CartModel>(context, listen: false)
                                .removeFromCart(product);
                          }
                        },
                      ),
                      Text('${cartItem.quantity}'),
                    ],
                  ),
                );
              },
            ),
          ),
          Divider(),
          ListTile(
            title: Text('Total'),
            trailing: Text('\$${cart.total.toStringAsFixed(2)}'),
          ),
          SizedBox(height: kDefaultPaddin),
        ],
      ),
    );
  }
}

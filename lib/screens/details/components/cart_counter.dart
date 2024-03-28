import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';
import '../../../models/product.dart';
import 'cart_management.dart';

class CartCounter extends StatefulWidget {
  final Product product;

  const CartCounter({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  _CartCounterState createState() => _CartCounterState();
}

class _CartCounterState extends State<CartCounter> {
  late CartModel cartModel;
  late int numOfItems;

  @override
  void initState() {
    super.initState();
    cartModel = Provider.of<CartModel>(context, listen: false);
    // Initialize numOfItems with the current quantity in the cart
    numOfItems = cartModel.items
        .firstWhere((item) => item.product.id == widget.product.id,
            orElse: () => CartItem(product: widget.product))
        .quantity;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        buildOutlineButton(
          icon: Icons.remove,
          press: () {
            if (numOfItems > 1) {
              setState(() {
                cartModel.updateQuantity(widget.product, numOfItems - 1);
                numOfItems--; // Update local quantity
              });
            }
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin / 2),
          child: Text(
            // If the item is less than 10 then show 01, 02 like that
            numOfItems.toString().padLeft(2, "0"),
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        buildOutlineButton(
            icon: Icons.add,
            press: () {
              setState(() {
                cartModel.updateQuantity(widget.product, numOfItems + 1);
                numOfItems++; // Update local quantity
              });
            }),
      ],
    );
  }

  SizedBox buildOutlineButton(
      {required IconData icon, required VoidCallback press}) {
    return SizedBox(
      width: 40,
      height: 32,
      child: ElevatedButton(
        onPressed: press,
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(13),
            side: BorderSide(color: Colors.black), // Add outlined border
          ),
        ),
        child: Icon(icon),
      ),
    );
  }
}

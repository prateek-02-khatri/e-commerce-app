import 'package:e_commerce_app/utils/constants.dart';
import 'package:e_commerce_app/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../provider/cart_provider.dart';
import '../../../utils/utils.dart';

class ItemDetails extends StatelessWidget {
  const ItemDetails({super.key, required this.product});
  final Product product;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        // Product Title
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              product.title,
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w800
              ),
            ),

            Consumer<CartProvider>(
              builder: (BuildContext context, CartProvider value, Widget? child) {
                return GestureDetector(
                  onTap: () {
                    if (value.cart.contains(product)) {
                      Utils.showSnackBar(
                        context: context,
                        message: 'Item already in cart',
                      );
                    } else {
                      value.addToCart(product);
                      Utils.showSnackBar(
                        context: context,
                        message: 'Item added to cart',
                        onPressed: () {
                          value.removeFromCart(value.cart.length-1);
                        }
                      );
                    }
                  },
                  child: Container(
                    width: 60,
                    height: 35,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: const Center(
                      child: Text(
                        'Buy',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ),
                );
              },
            )
          ],
        ),
        const SizedBox(height: 12),

        // Product Price & Seller
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              '\$${product.price}',
              style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w900
              ),
            ),
            Text.rich(
              TextSpan(
                children: [
                  const TextSpan(
                      text: 'Seller: ',
                      style: TextStyle(
                          fontSize: 16
                      )
                  ),
                  TextSpan(
                      text: product.seller,
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold
                      )
                  )
                ],
              ),
            )
          ],
        ),
        const SizedBox(height: 10,),

        // Product Rating & Reviews
        Row(
          children: [
            Container(
              width: 60,
              height: 25,
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: kPrimaryColor
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Icon(
                    Icons.star,
                    size: 16,
                    color: Colors.white,
                  ),
                  Text(
                    '${product.rate}',
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 5),
            Text(
              product.review,
              style: const TextStyle(
                fontSize: 15,
                color: Colors.grey
              ),
            ),
          ],
        ),
      ],
    );
  }
}
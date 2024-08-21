import 'package:e_commerce_app/screens/cart/cart_screen.dart';
import 'package:flutter/material.dart';
import '../../../utils/constants.dart';

class MyCart extends StatelessWidget {
  const MyCart({super.key});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const CartScreen()));
      },
      child: Container(
        width: 55,
        height: 55,
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: kPrimaryColor
        ),
        child: const Icon(
          Icons.shopping_cart_sharp,
          color: Colors.white,
          size: 28,
        ),
      ),
    );
  }
}

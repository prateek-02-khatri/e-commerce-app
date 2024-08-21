import 'package:e_commerce_app/utils/constants.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {},
          style: IconButton.styleFrom(
            backgroundColor: kContentColor,
            padding: const EdgeInsets.all(20),
          ),
          icon: Image.asset(
            'images/icon.png',
            height: 20,
          )
        ),

        IconButton(
          onPressed: () {},
          style: IconButton.styleFrom(
            backgroundColor: kContentColor,
            padding: const EdgeInsets.all(20),
          ),
          icon: const Icon(
            Icons.notifications_outlined,
            size: 20,
          )
        ),
      ],
    );
  }
}

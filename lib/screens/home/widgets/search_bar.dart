import 'package:e_commerce_app/utils/constants.dart';
import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: kContentColor
      ),
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
      child: Row(
        children: [
          const Icon(
            Icons.search,
            color: Colors.grey,
            size: 30,
          ),

          const SizedBox(width: 10,),

          const Flexible(
            flex: 4,
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search...',
                border: InputBorder.none
              ),
            )
          ),

          Container(
            height: 25,
            width: 1.5,
            color: Colors.grey,
          ),

          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.tune,
              color: Colors.grey,
            )
          )
        ],
      ),
    );
  }
}

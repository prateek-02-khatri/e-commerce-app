import 'package:e_commerce_app/models/product_model.dart';
import 'package:e_commerce_app/provider/favorite_provider.dart';
import 'package:e_commerce_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailAppBar extends StatelessWidget {
  const DetailAppBar({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {

    final provider = Provider.of<FavoriteProvider>(context);

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
              onPressed: () => Navigator.pop(context),
              style: IconButton.styleFrom(
                backgroundColor: Colors.white,
                padding: const EdgeInsets.all(15),
              ),
              icon: const Icon(
                Icons.arrow_back_ios_outlined,
              )
          ),

          const Spacer(),

          IconButton(
              onPressed: () {},
              style: IconButton.styleFrom(
                backgroundColor: Colors.white,
                padding: const EdgeInsets.all(15),
              ),
              icon: const Icon(
                Icons.share_outlined,
              )
          ),

          const SizedBox(width: 10,),

          IconButton(
            onPressed: () {
              if (provider.favoriteProducts.contains(product)) {
                provider.removeFromFavorite(product);
              } else {
                provider.addToFavorite(product);
              }
            },
            style: IconButton.styleFrom(
              backgroundColor: Colors.white,
              padding: const EdgeInsets.all(15),
            ),
            icon: Icon(
              provider.favoriteProducts.contains(product) ?
              Icons.favorite_outlined :
              Icons.favorite_outline,

              color: provider.favoriteProducts.contains(product) ? kPrimaryColor : Colors.black,
            )
          ),
        ],
      ),
    );
  }
}

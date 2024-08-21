import 'package:e_commerce_app/provider/favorite_provider.dart';
import 'package:e_commerce_app/utils/constants.dart';
import 'package:e_commerce_app/models/product_model.dart';
import 'package:e_commerce_app/screens/detail/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductCart extends StatelessWidget {
  const ProductCart({super.key, required this.product});
  final Product product;
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final provider = Provider.of<FavoriteProvider>(context);
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>
              DetailScreen(
                product: product,
                isFavorite: provider.favoriteProducts.contains(product)
              )
          )
        );
      },
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: kContentColor
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 5),
                Center(
                  child: Hero(
                    tag: product.image,
                    child: Image.asset(
                      product.image,
                      width: (screenWidth * 0.75)/2,
                      height: (screenWidth * 0.75)/2,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                const SizedBox(height: 10,),

                Padding(
                  padding: const EdgeInsets.only(left: 5.0),
                  child: Text(
                    product.title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),

                const SizedBox(height: 5,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      '\$${product.price}',
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    Row(
                      children: List.generate(
                        product.colors.length,
                        (index) => Container(
                          height: 18,
                          width: 18,
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: product.colors[index]
                          ),
                        )
                      ),
                    )
                  ],
                )
              ],
            ),
          ),

          Align(
            alignment: Alignment.topRight,
            child: Container(
              width: 35,
              height: 35,
              padding: const EdgeInsets.all(5.0),
              decoration: const BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                  bottomLeft: Radius.circular(10)
                )
              ),
              child: GestureDetector(
                onTap: () {
                  if (provider.favoriteProducts.contains(product)) {
                    provider.removeFromFavorite(product);
                  } else {
                    provider.addToFavorite(product);
                  }
                },
                child: Icon(
                  provider.favoriteProducts.contains(product) ?
                  Icons.favorite_outlined :
                  Icons.favorite_outline,
                  color: Colors.white,
                  size: 22,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

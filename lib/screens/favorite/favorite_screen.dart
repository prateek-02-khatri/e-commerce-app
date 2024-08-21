import 'package:e_commerce_app/models/product_model.dart';
import 'package:e_commerce_app/provider/favorite_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../utils/constants.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kContentColor,
      body: SafeArea(
        child: Column(
          children: [

            // Favorite App Bar
            const SizedBox(height: 15,),
            const Center(
              child: Text(
                'Favorite Products',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            const SizedBox(height: 20,),

            // Favorite Product List
            Consumer<FavoriteProvider>(
              builder: (BuildContext context, FavoriteProvider value, Widget? child) {
                return
                value.favoriteProducts.isEmpty ?
                const Text(
                  'No Favorite Product..!!',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ) :
                Expanded(
                  child: ListView.builder(
                    itemCount: value.favoriteProducts.length,
                    itemBuilder: (context, index) {
                      Product product = value.favoriteProducts[index];
                      return Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(15),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              padding: const EdgeInsets.all(10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(15),
                                    width: 100,
                                    height: 120,
                                    decoration: BoxDecoration(
                                        color: kContentColor,
                                        borderRadius: BorderRadius.circular(20)
                                    ),
                                    child: Image.asset(
                                      product.image
                                    ),
                                  ),
                                  const SizedBox(width: 10,),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      // Title
                                      Text(
                                        product.title,
                                        style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold
                                        ),
                                      ),
                                      const SizedBox(height: 5),
                                      // Category
                                      Text(
                                        product.category,
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      // Price
                                      Text(
                                        '\$${product.price}',
                                        style: const TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),

                          Positioned(
                            top: 30,
                            right: 35,
                            child:
                            IconButton(
                                onPressed: () {
                                  value.removeFromFavorite(product);
                                },
                                icon: const Icon(
                                  Icons.delete,
                                  size: 24,
                                  color: Colors.red,
                                )
                            ),
                          )
                        ],
                      );
                    }
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

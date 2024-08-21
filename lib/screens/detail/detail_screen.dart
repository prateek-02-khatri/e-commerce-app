import 'package:e_commerce_app/utils/constants.dart';
import 'package:e_commerce_app/models/product_model.dart';
import 'package:e_commerce_app/screens/detail/widgets/my_cart.dart';
import 'package:e_commerce_app/screens/detail/widgets/detail_app_bar.dart';
import 'package:e_commerce_app/screens/detail/widgets/detail_image_slider.dart';
import 'package:e_commerce_app/screens/detail/widgets/item_details.dart';
import 'package:e_commerce_app/screens/detail/widgets/product_description.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key, required this.product, required this.isFavorite});

  final Product product;
  final bool isFavorite;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {

  int currentSlide = 0;
  int currentColor = 0;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: kContentColor,
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Detail Screen App Bar
                    DetailAppBar(product: widget.product),

                    // Image Slider
                    DetailImageSlider(
                        currentSlide: currentSlide,
                        onChange: (value) {
                          setState(() {
                            currentSlide = value;
                          });
                        },
                        image: widget.product.image
                    ),
                    const SizedBox(height: 20,),

                    // Item Details
                    Container(
                        padding: const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 150),
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(40),
                              topLeft: Radius.circular(40),
                            )
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [

                            // Item Details
                            ItemDetails(product: widget.product),
                            const SizedBox(height: 10,),

                            // Product Colors
                            const Text(
                              'Color',
                              style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                            const SizedBox(height: 5,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: List.generate(
                                  widget.product.colors.length,
                                      (index) => GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        currentColor = index;
                                      });
                                    },
                                    child: AnimatedContainer(
                                      duration: const Duration(milliseconds: 3),
                                      width: 40,
                                      height: 40,
                                      margin: const EdgeInsets.only(right: 15),
                                      padding: currentColor == index ? const EdgeInsets.all(2) : EdgeInsets.zero,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: currentColor == index ? Border.all(color: widget.product.colors[index]) : null,
                                          color: currentColor == index ? Colors.white : widget.product.colors[index]
                                      ),
                                      child: Container(
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: widget.product.colors[index]
                                        ),
                                      ),
                                    ),
                                  )
                              ),
                            ),

                            // Description
                            const SizedBox(height: 20,),
                            ProductDescription(
                              description: widget.product.description,
                            ),
                          ],
                        )
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: const MyCart(),
    );
  }
}

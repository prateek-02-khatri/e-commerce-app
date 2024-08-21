import 'package:e_commerce_app/models/product_model.dart';
import 'package:e_commerce_app/screens/home/widgets/home_app_bar.dart';
import 'package:e_commerce_app/screens/home/widgets/home_image_slider.dart';
import 'package:e_commerce_app/screens/home/widgets/product_cart.dart';
import 'package:e_commerce_app/screens/home/widgets/search_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../models/category.dart';
import '../../utils/constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int currentSlide = 0;
  int selectedIndex = 0;
  List<List<Product>> productCategory = [
    all,
    shoes,
    beauty,
    womenFashion,
    jewelry,
    menFashion,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.white,

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              const SizedBox(height: 25,),

              // Home Screen App Bar
              const CustomAppBar(),
              const SizedBox(height: 5,),

              // Search Bar
              const CustomSearchBar(),
              const SizedBox(height: 20,),

              // Slider
              HomeImageSlider(
                currentSlide: currentSlide,
                onChange: (value) {
                  setState(() {
                    currentSlide = value;
                  });
                },
              ),
              const SizedBox(height: 20,),

              // Category Selection
              SizedBox(
                height: 140,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categoriesList.length,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                        child: Column(
                          children: [
                            Container(
                              width: 65,
                              height: 65,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(
                                        categoriesList[index].image,
                                      )
                                  )
                              ),
                            ),
                            const SizedBox(height: 10,),
                            Text(
                              categoriesList[index].title,
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: selectedIndex == index ? kPrimaryColor : Colors.black
                              ),
                              textAlign: TextAlign.center,
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 10,),

              // Special For You
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Special For You',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w800
                    ),
                  ),

                  Text(
                    'See All',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black54
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20,),

              // For Shopping Items
              GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: productCategory[selectedIndex].length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.7,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                ),
                itemBuilder: (context, index) {
                  return ProductCart(product: productCategory[selectedIndex][index]);
                }
              )
            ],
          ),
        ),
      ),
    );
  }
}

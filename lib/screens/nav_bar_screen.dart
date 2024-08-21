import 'package:e_commerce_app/screens/profile/profile_screen.dart';
import 'package:e_commerce_app/utils/constants.dart';
import 'package:e_commerce_app/screens/cart/cart_screen.dart';
import 'package:e_commerce_app/screens/favorite/favorite_screen.dart';
import 'package:e_commerce_app/screens/home/home_screen.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  const
  BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {

  int currentIndex = 2;

  List<Widget> screens = [
    const Scaffold(backgroundColor: kContentColor),
    const FavoriteScreen(),
    const HomeScreen(),
    const CartScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.white,

      body: screens[currentIndex],

      bottomNavigationBar: BottomAppBar(
        elevation: 1,
        height: 65,
        color: Colors.white,
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            customIcon(
              () {
                setState(() {
                  currentIndex = 0;
                });
              },
              Icons.grid_view_outlined,
              0
            ),

            customIcon(
              () {
                setState(() {
                  currentIndex = 1;
                });
              },
              Icons.favorite_border,
              1
            ),

            customIcon(
              () {
                setState(() {
                  currentIndex = 2;
                });
              },
              Icons.home,
              2
            ),

            customIcon(
              () {
                setState(() {
                  currentIndex = 3;
                });
              },
              Icons.shopping_cart_outlined,
              3
            ),

            customIcon(
              () {
                setState(() {
                  currentIndex = 4;
                });
              },
              Icons.person,
              4
            ),
          ],
        ),
      ),
    );
  }

  customIcon(VoidCallback onPressed, IconData icon, int index) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(
        icon,
        size: 35,
        color: currentIndex == index ? kPrimaryColor : Colors.grey.shade400
      )
    );
  }
}

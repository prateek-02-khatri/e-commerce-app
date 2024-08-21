import 'package:flutter/material.dart';

class HomeImageSlider extends StatelessWidget {
  const HomeImageSlider({super.key, required this.onChange, required this.currentSlide});

  final Function (int) onChange;
  final int currentSlide;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 220,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: PageView(
              scrollDirection: Axis.horizontal,
              allowImplicitScrolling: true,
              physics: const ClampingScrollPhysics(),
              onPageChanged: onChange,
              children: [
                Image.asset(
                  'images/slider.jpg',
                  fit: BoxFit.fill,
                ),
                Image.asset(
                  'images/image1.png',
                  fit: BoxFit.cover,
                ),
                Image.asset(
                  'images/slider3.png',
                  fit: BoxFit.cover,
                ),
              ]
            ),
          ),
        ),

        Positioned.fill(
          bottom: 10,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:
                List.generate(
                  3,
                  (index) => AnimatedContainer(
                      duration: const Duration(microseconds: 300),
                      width: currentSlide == index ? 15 : 8,
                      height: 8,
                      margin: const EdgeInsets.only(right: 8.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: currentSlide == index ? Colors.black : Colors.grey.shade200
                      ),
                    )
                ),
            ),
          ),
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';

class DetailImageSlider extends StatelessWidget {
  const DetailImageSlider({super.key, required this.onChange, required this.currentSlide, required this.image});

  final Function (int) onChange;
  final int currentSlide;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 250,
          child: PageView.builder(
            onPageChanged: onChange,
            itemCount: 4,
            itemBuilder: (context, index) {
              return Hero(
                tag: image,
                child: Image.asset(image)
              );
            },
          ),
        ),
        const SizedBox(height: 10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children:
          List.generate(
              4,
                  (index) => AnimatedContainer(
                duration: const Duration(microseconds: 300),
                width: currentSlide == index ? 15 : 8,
                height: 8,
                margin: const EdgeInsets.only(right: 8.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(color: Colors.black),
                    color: currentSlide == index ? Colors.black : Colors.transparent
                ),
              )
          ),
        ),
      ],
    );
  }
}

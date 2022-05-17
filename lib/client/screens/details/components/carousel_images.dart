import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';

class CarouselImages extends StatefulWidget {
  @override
  _CarouselImagesState createState() => _CarouselImagesState();
}

class _CarouselImagesState extends State<CarouselImages> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.35,
      child: Carousel(
        dotSize: 5,
        dotBgColor: Colors.transparent,
        autoplay: false,
        images: [
          Image.asset(
            'assets/images/house1.jpeg',
            fit: BoxFit.cover,
          ),
          Image.asset(
            'assets/images/indoor1.jpg',
            fit: BoxFit.cover,
          ),
          Image.asset(
            'assets/images/indoor2.jpg',
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }
}

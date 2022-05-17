import 'package:flutter/material.dart';
import 'package:real_estate_app/client/screens/details/components/bottom_buttons.dart';
import 'package:real_estate_app/client/screens/details/components/carousel_images.dart';
import 'package:real_estate_app/client/screens/details/components/custom_app_bar.dart';
import 'package:real_estate_app/client/screens/details/components/house_details.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({Key key}) : super(key: key);

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Column(
            children: [
              Stack(
                children: [
                  CarouselImages(),
                  CustomAppBar(),
                ],
              ),
              HouseDetails(),
            ],
          ),
          BottomButtons(),
        ],
      ),
    );
  }
}

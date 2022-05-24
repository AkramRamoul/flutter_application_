import 'package:flutter/material.dart';

import 'package:real_estate_app/client/screens/home/components/custom_app_bar.dart';
import 'package:real_estate_app/client/screens/home/components/houses.dart';
import 'package:real_estate_app/client/screens/home/components/mapbutton.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Column(
            children: [
              CustomAppBar(),
              Houses(),
            ],
          ),
          MapButton(),
        ],
      ),
    );
  }
}

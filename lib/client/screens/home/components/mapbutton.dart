import 'package:flutter/material.dart';
import 'package:real_estate_app/client/constants/constants.dart';
import 'package:real_estate_app/client/screens/details/components/mapview.dart';

class MapButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.only(bottom: appPadding),
      child: Container(
        width: size.width * 0.4,
        height: 60,
        decoration: BoxDecoration(
            color: darkBlue,
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                  color: darkBlue.withOpacity(0.6),
                  offset: Offset(0, 10),
                  blurRadius: 10)
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MapView()));
              },
              icon: Icon(
                (Icons.map_outlined),
                color: white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

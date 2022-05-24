import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:real_estate_app/client/constants/constants.dart';
import 'package:real_estate_app/client/screens/details/components/housedetails.dart';
import 'package:real_estate_app/helpers/Api.dart';

class Houses extends StatefulWidget {
  @override
  _HousesState createState() => _HousesState();
}

class _HousesState extends State<Houses> {
  @override
  var _offers = [];
  bool isFav = false;

  @override
  void initState() {
    super.initState();
    _loadOffers();
  }

  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: _offers.length,
        itemBuilder: _buildHouse,
      ),
    );
  }

  Widget _buildHouse(BuildContext context, int index) {
    Size size = MediaQuery.of(context).size;

    return GestureDetector(
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: appPadding, vertical: appPadding / 2),
        child: Container(
          height: 250,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      'assets/images/house1.jpeg',
                      fit: BoxFit.cover,
                      height: 180,
                      width: 600,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    '\$' + _offers[index]['price'].toString(),
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Text(
                      _offers[index]['title'],
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 15, color: black.withOpacity(0.4)),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    _offers[index]['bedrooms'].toString() + ' bedrooms / ',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    _offers[index]['bathrooms'].toString() + ' bathrooms / ',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    _offers[index]['area'].toString() + 'm²',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    housedetails(offer_id: _offers[index]['id'])));
      },
    );
  }

  _loadOffers() async {
    var response = await Api().getData('/offer');
    if (response.statusCode == 200) {
      setState(() {
        print(response.body);
        _offers = json.decode(response.body);
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Error ' + response.statusCode + ': ' + response.body),
      ));
    }
  }
}

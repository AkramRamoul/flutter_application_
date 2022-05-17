import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:real_estate_app/client/constants/constants.dart';
import 'package:real_estate_app/helpers/Api.dart';

class HouseDetails extends StatefulWidget {
  HouseDetails();

  @override
  _HouseDetailsState createState() => _HouseDetailsState();
}

class _HouseDetailsState extends State<HouseDetails> {
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
        shrinkWrap: true,
        itemBuilder: _builddetails,
      ),
    );
  }

  Widget _builddetails(BuildContext context, int index) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
            bottom: appPadding,
            left: appPadding,
            right: appPadding,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _offers[index]['price'].toString() + '\$',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'adrress',
                    style: TextStyle(
                      fontSize: 15,
                      color: black.withOpacity(0.4),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: appPadding, bottom: appPadding),
          child: Text(
            _offers[index]['title'],
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          height: 130,
          child: ListView(
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: appPadding,
                  bottom: appPadding,
                ),
                child: Container(
                  width: 100,
                  decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: black.withOpacity(0.4),
                      )),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        _offers[index]['area'].toString(),
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'm²',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: appPadding,
                  bottom: appPadding,
                ),
                child: Container(
                  width: 100,
                  decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: black.withOpacity(0.4),
                      )),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        _offers[index]['bedrooms'].toString(),
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Bedrooms',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: appPadding,
                  bottom: appPadding,
                ),
                child: Container(
                  width: 100,
                  decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: black.withOpacity(0.4),
                      )),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        _offers[index]['bathrooms'].toString(),
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Bathrooms',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: appPadding,
                  bottom: appPadding,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: appPadding,
            right: appPadding,
            bottom: appPadding * 4,
          ),
        )
      ],
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

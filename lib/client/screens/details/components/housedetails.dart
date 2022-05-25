import 'dart:convert';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:real_estate_app/client/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:real_estate_app/client/screens/details/components/bottom_buttons.dart';
import 'package:real_estate_app/helpers/Api.dart';

import '../../../constants/constants.dart';

class housedetails extends StatefulWidget {
  @override
  _OfferDetailsState createState() => _OfferDetailsState();
  final int offer_id;
  housedetails({this.offer_id});
}

class _OfferDetailsState extends State<housedetails> {
  @override
  void initState() {
    super.initState();
    _loadOfferDetails();
  }

  var offer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(0, 80, 0, 0),
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.topCenter,
              child: offer != null ? _buildFormFields() : Text('Loading...'),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildFormFields() {
    return Container(
      margin: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 80.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            _buildGridView(),
            SizedBox(
              height: 100,
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: appPadding, bottom: appPadding),
              child: Text(
                offer['title'],
                style: TextStyle(
                  fontSize: 35,
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
                            offer['price'].toString(),
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Dinars',
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
                            offer['area'].toString(),
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
                            offer['bedrooms'].toString(),
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
                            offer['bathrooms'].toString(),
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
            SizedBox(
              height: 30,
            ),
            BottomButtons(),
          ],
        ),
      ),
    );
  }

  // Widget _buildRegisterText() {
  // return Text(
  //   'REGISTER',
  //   textAlign: TextAlign.center,
  //   style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
  // );
  // }

  Widget _buildGridView() {
    return Container(
      child: PhotoViewGallery.builder(
        scrollPhysics: const BouncingScrollPhysics(),
        builder: (BuildContext context, int index) {
          return PhotoViewGalleryPageOptions(
            imageProvider: NetworkImage(
                Api().getOfferImageUrl(offer['images'][index]['id'])),
            initialScale: PhotoViewComputedScale.contained * 0.8,
          );
        },
        itemCount: offer['images'].length,
        loadingBuilder: (context, event) => Center(
          child: Container(
            width: 20.0,
            height: 20.0,
            child: CircularProgressIndicator(
              value: event == null
                  ? 0
                  : event.cumulativeBytesLoaded / event.expectedTotalBytes,
            ),
          ),
        ),
      ),
    );
  }

  _loadOfferDetails() async {
    var response = await Api().getData('/offer/' + widget.offer_id.toString());
    if (response.statusCode == 200) {
      setState(() {
        offer = json.decode(response.body);
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
            'Error ' + response.statusCode.toString() + ': ' + response.body),
      ));
    }
  }
}

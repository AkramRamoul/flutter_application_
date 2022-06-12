import 'package:flutter/material.dart';
import 'package:real_estate_app/helpers/Api.dart';

class AgencyProfilePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _OffersListState();
  }
}

class _OffersListState extends State<AgencyProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        // profile photo
        Container(
          height: 120,
          width: 120,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.grey[200],
          ),
        ),

        // username
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            'Username',
            style: TextStyle(color: Colors.black, fontSize: 20),
          ),
        ),
        SizedBox(height: 15),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
              child: Text('Edit profile',
                  style: TextStyle(color: Colors.black, fontSize: 20)),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(5)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: Container(
                padding: EdgeInsets.all(15),
                child: Icon(
                  Icons.camera_alt,
                  color: Colors.grey[800],
                ),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(5)),
              ),
            ),
          ],
        ),
        SizedBox(height: 15),
      ],
    ));
  }
}

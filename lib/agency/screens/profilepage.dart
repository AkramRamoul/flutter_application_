import 'package:flutter/material.dart';
import 'package:real_estate_app/helpers/Api.dart';

class AgencyProfilePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _OffersListState();
  }
}

class _OffersListState extends State<AgencyProfilePage> {
  var _offers = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Expanded(
            child: ListView.builder(
          itemBuilder: _buildOfferItem,
        ))
      ]),
    );
  }

  Widget _buildOfferItem(BuildContext context, int index) {
    return DefaultTabController(
      length: 1,
      child: Scaffold(
        backgroundColor: Colors.white,
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
                _offers[index]['email'],
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
            ),
            SizedBox(height: 15),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [],
            ),
          ],
        ),
      ),
    );
  }

  deleteData(id) async {
    var response = await Api().deleteData('$id');
    if (response.statusCode == 200) {
      setState(() {
        print('deleted');
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Error ' + response.statusCode),
      ));
    }
  }
}

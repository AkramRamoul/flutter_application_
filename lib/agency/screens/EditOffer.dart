import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:real_estate_app/agency/agency_main_screen.dart';
import 'package:real_estate_app/helpers/Api.dart';

class EditOffer extends StatefulWidget {
  @override
  _OfferDetailsState createState() => _OfferDetailsState();
  final int offer_id;
  EditOffer({this.offer_id});
}

class _OfferDetailsState extends State<EditOffer> {
  @override
  void initState() {
    super.initState();
    _loadOfferDetails();
    _loadCategories();
  }

  var user_id = 1;
  var title;
  var number;
  var price;
  var area;
  var bedrooms;
  var bathrooms;
  String category_id = "2";
  var categories = [];
  var offer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 20.0),
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
            TextFormField(
              initialValue: offer['title'],
              decoration: InputDecoration(labelText: 'Title'),
              onChanged: (value) {
                title = value;
              },
            ),
            TextFormField(
              initialValue: offer['price'].toString(),
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  icon: Icon(Icons.attach_money_outlined), labelText: 'Price'),
              onChanged: (value) {
                price = value;
              },
            ),
            TextFormField(
              initialValue: offer['area'].toString(),
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  icon: Icon(Icons.square_foot), labelText: 'Surace Area'),
              onChanged: (value) {
                area = value;
              },
            ),
            TextFormField(
              initialValue: offer['bedrooms'].toString(),
              keyboardType: TextInputType.number,
              decoration:
                  InputDecoration(icon: Icon(Icons.bed), labelText: 'bedrooms'),
              onChanged: (value) {
                bedrooms = value;
              },
            ),
            TextFormField(
              initialValue: offer['bathrooms'].toString(),
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  icon: Icon(Icons.bathroom_outlined), labelText: 'bathrooms'),
              onChanged: (value) {
                bathrooms = value;
              },
            ),
            TextFormField(
              initialValue: offer['number'].toString(),
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  icon: Icon(Icons.phone), labelText: 'Phone Number'),
              onChanged: (value) {
                number = value;
              },
            ),
            DropdownButton(
              hint: Text('Select Category'),
              items: categories.map((item) {
                return new DropdownMenuItem(
                  child: Text(item['name']),
                  value: item['id'].toString(),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  category_id = value;
                });
              },
              value: category_id,
            ),
            // OutlinedButton(onPressed: getImage, child: _buildImage()),
            SizedBox(
              height: 20.0,
            ),
            _buildSubmitButton(),
            SizedBox(
              height: 10.0,
            ),

            //_buildRegisterText(),
          ],
        ),
      ),
    );
  }

  Widget _buildSubmitButton() {
    return ElevatedButton(
      onPressed: () {
        _submit();
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Agencymain()));
      },
      style: ElevatedButton.styleFrom(
        primary: Colors.deepPurple,
      ),
      child: Text(
        'Submit',
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  _loadCategories() async {
    var response = await Api().getData('/category');
    if (response.statusCode == 200) {
      setState(() {
        categories = json.decode(response.body);
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
            'Error ' + response.statusCode.toString() + ': ' + response.body),
      ));
    }
  }

  void _submit() async {
    // setState(() {
    //   _isLoading = true;
    // });
    var data = new Map<String, String>();
    data['title'] = title;
    data['price'] = price;
    data['area'] = area;
    data['user_id'] = user_id.toString();
    data['number'] = number.toString();
    data['bedrooms'] = bedrooms;
    data['bathrooms'] = bathrooms;
    data['category_id'] = category_id.toString();
    // data['image'] = _image.path;

    var response = await Api().editData(data, widget.offer_id.toString());

    // var response = await Api().postData(data, '/offer');

    if (response.statusCode == 200) {
      _showMsg('Offer Edited');
      Navigator.pop(context);
    } else {
      _showMsg('Error ${response.statusCode}');
    }
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

  _showMsg(msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(msg),
      action: SnackBarAction(
        label: 'Close',
        onPressed: () {
          // Some code to undo the change!
        },
      ),
    ));
  }
}

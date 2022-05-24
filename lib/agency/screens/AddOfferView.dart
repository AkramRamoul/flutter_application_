import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:real_estate_app/helpers/Api.dart';

class AddOfferView extends StatefulWidget {
  @override
  _AddOfferState createState() => _AddOfferState();
}

class _AddOfferState extends State<AddOfferView> {
  @override
  void initState() {
    super.initState();
    _loadCategories();
  }

  final _picker = ImagePicker();
  List<XFile> images = [];
  File _image;

  var user_id = 1;
  var title;
  var price;
  var area;
  var bedrooms;
  var bathrooms;
  String category_id = "2";
  var categories = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.topCenter,
            child: _buildFormFields(),
          )
        ],
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
              decoration: InputDecoration(labelText: 'Title'),
              onChanged: (value) {
                title = value;
              },
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  icon: Icon(Icons.attach_money_outlined), labelText: 'Price'),
              onChanged: (value) {
                price = value;
              },
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  icon: Icon(Icons.square_foot), labelText: 'Surace Area'),
              onChanged: (value) {
                area = value;
              },
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration:
                  InputDecoration(icon: Icon(Icons.bed), labelText: 'bedrooms'),
              onChanged: (value) {
                bedrooms = value;
              },
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  icon: Icon(Icons.bathroom_outlined), labelText: 'bathrooms'),
              onChanged: (value) {
                bathrooms = value;
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
            ElevatedButton(
              onPressed: _pickImages,
              child: Text(
                'Add Images',
              ),
            ),
            _buildGridView(),
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

  // Widget _buildRegisterText() {
  // return Text(
  //   'REGISTER',
  //   textAlign: TextAlign.center,
  //   style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
  // );
  // }
  Widget _buildImage() {
    if (_image == null) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(1, 1, 1, 1),
        child: Icon(
          Icons.add,
          color: Colors.grey,
        ),
      );
    } else {
      return Image.file(File(_image.path));
    }
  }

  Future getImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  Widget _buildGridView() {
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 3,
      childAspectRatio: 1,
      children: List.generate(images.length, (index) {
        File image = File(images[index].path);
        return Card(
          clipBehavior: Clip.antiAlias,
          child: Stack(
            children: <Widget>[
              Image.file(
                image,
                width: 300,
                height: 300,
              ),
              Positioned(
                right: 5,
                top: 5,
                child: InkWell(
                  child: Icon(
                    Icons.remove_circle,
                    size: 30,
                    color: Colors.red,
                  ),
                  onTap: () {
                    setState(() {
                      images.removeAt(index);
                    });
                  },
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  _pickImages() async {
    List<XFile> res = await _picker.pickMultiImage();
    setState(() {
      images.addAll(res);
    });
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
    data['bedrooms'] = bedrooms;
    data['bathrooms'] = bathrooms;
    data['category_id'] = category_id.toString();
    // data['image'] = _image.path;

    var response = await Api().postDataWithImages(data, '/offer', images);

    // var response = await Api().postData(data, '/offer');

    if (response.statusCode == 201) {
      Navigator.pop(context);
    } else {
      _showMsg('Error ${response.statusCode}');
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

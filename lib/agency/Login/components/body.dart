import 'dart:convert';
import 'package:real_estate_app/agency/Login/components/background.dart';
import 'package:real_estate_app/agency/agency_main_screen.dart';
import 'package:real_estate_app/helpers/Api.dart';
import 'package:flutter/material.dart';
import 'package:real_estate_app/client/screens/Login/composants/already_have_an_account_acheck.dart';
import 'package:real_estate_app/client/screens/Login/composants/rounded_button.dart';
import 'package:real_estate_app/client/screens/Login/composants/rounded_input_field.dart';
import 'package:real_estate_app/client/screens/Login/composants/rounded_password_field.dart';
import 'package:real_estate_app/client/screens/Login/ecrans/Signup/signup_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Body extends StatefulWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  var email;
  var password;
  bool _isLoading = true;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "LOGIN",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
            ),
            SizedBox(height: size.height * 0.03),
            Image.asset(
              "assets/icons/broker.jpg",
              height: size.height * 0.35,
            ),
            SizedBox(height: size.height * 0.03),
            RoundedInputField(
              hintText: "Your Email",
              onChanged: (value) {
                email = value;
              },
            ),
            RoundedPasswordField(
              onChanged: (value) {
                password = value;
              },
            ),
            RoundedButton(
              text: "LOGIN",
              press: () {
                _login();
              },
            ),
            SizedBox(height: size.height * 0.03),
          ],
        ),
      ),
    );
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

  void _login() async {
    setState(() {
      _isLoading = true;
    });
    var data = {'email': email, 'password': password};

    var map = new Map<String, dynamic>();
    map['email'] = email;
    map['password'] = password;
    var response = await Api().postData(data, '/signin');

    if (response.statusCode == 200) {
      var body = json.decode(response.body);
      // _showMsg(response.body);

      SharedPreferences localStorage = await SharedPreferences.getInstance();
      localStorage.setString('token', json.encode(body['token']));
      localStorage.setString('user', json.encode(body['user']));
      localStorage.setString('user', json.encode(body['id']));

      Navigator.push(
        context,
        new MaterialPageRoute(builder: (context) => Agencymain()),
      );
      _showMsg(body['message']);
      Navigator.pop(context);
    } else {
      _showMsg('Error ${response.statusCode}');
    }

    setState(() {
      _isLoading = false;
    });
  }
}

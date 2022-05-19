import 'package:flutter/material.dart';
import 'package:real_estate_app/client/screens/Login/composants/already_have_an_account_acheck.dart';
import 'package:real_estate_app/client/screens/Login/composants/rounded_button.dart';
import 'package:real_estate_app/client/screens/Login/composants/rounded_input_field.dart';
import 'package:real_estate_app/client/screens/Login/composants/rounded_password_field.dart';
import 'package:real_estate_app/client/screens/Login/ecrans/Login/login_screen.dart';
import 'package:real_estate_app/client/screens/Login/ecrans/Signup/components/background.dart';
import 'package:real_estate_app/client/screens/home/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'dart:convert';
import 'package:real_estate_app/helpers/Api.dart';

class Body extends StatefulWidget {
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  var email;
  var password;
  bool _isLoading = true;
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "SIGNUP",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
            ),
            SizedBox(height: size.height * 0.03),
            Image.asset(
              "assets/images/signup.png",
              height: size.height * 0.35,
            ),
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
              text: "SIGNUP",
              press: () {
                _signup();
              },
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              login: false,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
                    },
                  ),
                );
              },
            ),
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

  void _signup() async {
    setState(() {
      _isLoading = true;
    });
    var data = {'email': email, 'password': password};

    var map = new Map<String, dynamic>();
    map['email'] = email;
    map['password'] = password;
    var response = await Api().postData(data, '/register');

    if (response.statusCode == 201) {
      var body = json.decode(response.body);
      _showMsg(response.body);

      SharedPreferences localStorage = await SharedPreferences.getInstance();
      localStorage.setString('token', json.encode(body['token']));
      localStorage.setString('user', json.encode(body['user']));
      Navigator.push(
        context,
        new MaterialPageRoute(builder: (context) => HomeScreen()),
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

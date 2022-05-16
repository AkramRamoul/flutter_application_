import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:real_estate_app/client/constants/constants.dart';
import 'package:real_estate_app/client/screens/home/home_screen.dart';
import 'package:real_estate_app/helpers/Api.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var email;
  var password;
  bool _isLoading = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildLoginLayout(),
    );
  }

  Widget _buildLoginLayout() {
    return Stack(
      children: <Widget>[
        Align(
          alignment: Alignment.topCenter,
          child: AppLogo(),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: _buildLoginFields(),
        )
      ],
    );
  }

  Widget _buildLoginFields() {
    return Container(
      margin: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 80.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            _buildEmailField(),
            SizedBox(
              height: 10.0,
            ),
            _buildPasswordField(),
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

  Widget _buildEmailField() {
    return TextFormField(
      cursorColor: kPrimaryColor,
      decoration: InputDecoration(
        labelText: 'Email',
        hintText: 'Email',
        icon: Icon(
          Icons.person,
          color: kPrimaryColor,
        ),
      ),
      validator: (emailValue) {
        if (emailValue.isEmpty) {
          return 'Please enter email';
        }
        return null;
      },
      onChanged: (value) {
        email = value;
      },
    );
  }

  Widget _buildPasswordField() {
    return TextFormField(
      obscureText: true,
      decoration: InputDecoration(
        labelText: 'Password',
        hintText: "Password",
        icon: Icon(
          Icons.lock,
          color: kPrimaryColor,
        ),
        suffixIcon: Icon(
          Icons.visibility,
          color: kPrimaryColor,
        ),
      ),
      validator: (passwordValue) {
        if (passwordValue.isEmpty) {
          return 'Please enter password';
        }

        return null;
      },
      onChanged: (value) {
        password = value;
      },
    );
  }

  Widget _buildSubmitButton() {
    return ElevatedButton(
      onPressed: () {
        _login();
      },
      style: ElevatedButton.styleFrom(
          primary: kPrimaryColor,
          padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
          textStyle: TextStyle(
              color: white, fontSize: 14, fontWeight: FontWeight.w500)),
      child: Text(
        'LOGIN',
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

class AppLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.only(top: 75.0),
      width: 250.0,
      height: 250.0,
      decoration:
          BoxDecoration(shape: BoxShape.circle, color: Colors.transparent),
      child: Image.asset(
        "assets/images/login.png",
        height: size.height * 1,
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:real_estate_app/agency/Login/Agency_login_screen.dart';
import 'package:real_estate_app/client/screens/home/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Loading extends StatefulWidget {
  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String token;
  bool initial = true;
  @override
  Widget build(BuildContext context) {
    if (initial) {
      SharedPreferences.getInstance().then((sharedPrefValue) {
        setState(() {
          initial = false;
          token = sharedPrefValue.getString('token');
          print('token' + token);
        });
      });
      return CircularProgressIndicator();
    } else {
      if (token == null) {
        return LoginScreen();
      } else {
        return HomeScreen();
      }
    }
  }
}

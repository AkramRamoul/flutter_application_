import 'package:flutter/material.dart';
import 'package:real_estate_app/agency/agency_main_screen.dart';
import 'package:real_estate_app/agency/screens/OffersListView.dart';
import 'package:real_estate_app/client/constants/constants.dart';
import 'package:real_estate_app/firstscreen/FIRSTSCREEN.dart';
import 'package:real_estate_app/loading.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Real Estate App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          scaffoldBackgroundColor: white),
      home: Loading(),
    );
  }
}

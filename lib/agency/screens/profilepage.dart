import 'package:flutter/material.dart';
import 'package:real_estate_app/client/screens/home/home_screen.dart';

class AgencyProfilePage extends StatefulWidget {
  @override
  State<AgencyProfilePage> createState() => _AgencyProfilePageState();
}

class _AgencyProfilePageState extends State<AgencyProfilePage> {
  @override
  Widget build(BuildContext context) {
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
                'User Name',
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
}

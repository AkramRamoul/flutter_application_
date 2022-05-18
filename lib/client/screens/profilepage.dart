import 'package:flutter/material.dart';
import 'package:real_estate_app/client/screens/home/home_screen.dart';
import 'package:real_estate_app/firstscreen/FIRSTSCREEN.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserProfilePage extends StatefulWidget {
  @override
  State<UserProfilePage> createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 1,
      child: Scaffold(
        appBar: AppBar(
          title: Text(' Name', style: TextStyle(color: Colors.black)),
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            color: Color.fromRGBO(0, 0, 0, 1),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return HomeScreen();
                  },
                ),
              );
            },
          ),
          actions: [
            IconButton(
              onPressed: () {
                logout().then((value) => {
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                              builder: (context) => WelcomeScreen()),
                          (route) => false)
                    });
              },
              icon: Icon(Icons.exit_to_app),
              color: Color.fromRGBO(0, 0, 0, 1),
            )
          ],
        ),
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
            // default tab controller

            TabBar(
              tabs: [
                Tab(
                  icon: Icon(Icons.favorite, color: Colors.black),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Future<bool> logout() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  return await pref.remove('token');
}

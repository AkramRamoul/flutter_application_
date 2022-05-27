import 'package:flutter/material.dart';
import 'package:real_estate_app/agency/Login/Agency_login_screen.dart';
import 'package:real_estate_app/agency/screens/profilepage.dart';
import 'package:real_estate_app/agency/screens/AddOfferView.dart';
import 'package:real_estate_app/agency/screens/OffersListView.dart';
import 'package:real_estate_app/firstscreen/FIRSTSCREEN.dart';

import 'package:shared_preferences/shared_preferences.dart';

class Agencymain extends StatefulWidget {
  Agencymain({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _AgencymainState createState() => _AgencymainState();
}

class _AgencymainState extends State<Agencymain> {
  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
      onWillPop: () async => false,
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text(' Manage Your Offers',
                style: TextStyle(color: Colors.black)),
            backgroundColor: Colors.transparent,
            elevation: 0,
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
              TabBar(
                tabs: [
                  Tab(
                    icon: Icon(Icons.add_box, color: Colors.deepPurple),
                  ),
                  Tab(
                    icon: Icon(Icons.drive_folder_upload_sharp,
                        color: Colors.deepPurple),
                  ),
                  Tab(
                    icon: Icon(Icons.person, color: Colors.deepPurple),
                  ),
                ],
              ),
              Expanded(
                  child: TabBarView(
                children: [
                  Container(
                    child: AddOfferView(),
                  ),
                  Container(
                    child: OffersListView(),
                  ),
                  Container(
                    child: AgencyProfilePage(),
                  )
                ],
              )),
            ],
          ),
        ),
      ),
    );
  }

  Future<bool> logout() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return await pref.remove('token');
  }
}

import 'package:flutter/material.dart';
import 'package:real_estate_app/agency/screens/profilepage.dart';
import 'package:real_estate_app/agency/screens/AddOfferView.dart';
import 'package:real_estate_app/agency/screens/OffersListView.dart';

class Agencymain extends StatefulWidget {
  Agencymain({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _AgencymainState createState() => _AgencymainState();
}

class _AgencymainState extends State<Agencymain> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(' Manage your Offers',
              style: TextStyle(color: Colors.white)),
          elevation: 0,
          centerTitle: true,
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
                  icon: Icon(Icons.favorite, color: Colors.deepPurple),
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
    );
  }
}

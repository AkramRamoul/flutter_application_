import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:real_estate_app/agency/screens/AddOfferView.dart';
import 'package:real_estate_app/agency/screens/OffersListView.dart';
import 'package:real_estate_app/client/screens/profilepage.dart';

class Agencymain extends StatefulWidget {
  Agencymain({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _AgencymainState createState() => _AgencymainState();
}

class _AgencymainState extends State<Agencymain> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _getData() async {
    var url = Uri.http('192.168.73.32:8000', '/api/offers/offer1');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var snackBar = SnackBar(
        content: Text(response.body),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

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
                  child: UserProfilePage(),
                )
              ],
            )),
          ],
        ),
      ),
    );
  }
}

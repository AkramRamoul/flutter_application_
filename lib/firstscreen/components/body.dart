import 'package:flutter/material.dart';
import 'package:real_estate_app/agency/Login/Agency_login_screen.dart';
import 'package:real_estate_app/client/constants/constants.dart';
import 'package:real_estate_app/client/screens/Login/composants/rounded_button.dart';
import 'package:real_estate_app/client/screens/Login/ecrans/Welcome/components/background.dart';
import 'package:real_estate_app/client/screens/Login/ecrans/Welcome/welcome_screen.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // This size provide us total height and width of our screen
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "What Do you Want To Do ",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
            ),
            SizedBox(height: size.height * 0.05),
            Image.asset(
              "assets/icons/chat.png",
              height: size.height * 0.45,
            ),
            SizedBox(height: size.height * 0.05),
            RoundedButton(
              text: "BUY",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return ClientWelcomeScreen();
                    },
                  ),
                );
              },
            ),
            RoundedButton(
              text: "Sell",
              color: kPrimaryLightColor,
              textColor: Colors.black,
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
}

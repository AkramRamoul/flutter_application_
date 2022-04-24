import 'package:flutter/material.dart';
import 'package:real_estate_app/screens/Login/composants/already_have_an_account_acheck.dart';
import 'package:real_estate_app/screens/Login/composants/rounded_button.dart';
import 'package:real_estate_app/screens/Login/composants/rounded_input_field.dart';
import 'package:real_estate_app/screens/Login/composants/rounded_password_field.dart';
import 'package:real_estate_app/screens/Login/ecrans/Login/components/background.dart';
import 'package:real_estate_app/screens/Login/ecrans/Signup/signup_screen.dart';
import 'package:real_estate_app/screens/home/home_screen.dart';

class Body extends StatelessWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "LOGIN",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
            ),
            SizedBox(height: size.height * 0.03),
            Image.asset(
              "assets/images/login.png",
              height: size.height * 0.35,
            ),
            SizedBox(height: size.height * 0.03),
            RoundedInputField(
              hintText: "Your Email",
              onChanged: (value) {},
            ),
            RoundedPasswordField(
              onChanged: (value) {},
            ),
            RoundedButton(
              text: "LOGIN",
              press: () {
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
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignUpScreen();
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

import 'package:flutter/material.dart';
import 'package:mess_card/screens/mainScreen.dart';
import 'networkig/authenticate.dart' as auth;
import 'package:mess_card/messcard/Card.dart';
import 'loginsystem/welcome_screen.dart';
import 'package:mess_card/messcard/CardData.dart';

void verifyLogin(BuildContext context) async {
  print('running verify token');
  CardData isLoggedin = await auth.authentictae();
  if (isLoggedin.data.length != 1) {
//    Navigator.pushNamedAndRemoveUntil(
//        context, MessCard.id, (Route<dynamic> route) => false,
//        arguments: CardData(data: isLoggedin.data, day: isLoggedin.day));
    Navigator.pushNamedAndRemoveUntil(
        context, MainScreen.id, (Route<dynamic> route) => false,
        arguments: CardData(data: isLoggedin.data, day: isLoggedin.day));
  } else {
    Navigator.pushNamedAndRemoveUntil(
        context, WelcomeScreen.id, (Route<dynamic> route) => false);
  }
}

class SplashScreen extends StatefulWidget {
  static final String id = "splash";

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    verifyLogin(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            'assets/logo.png',
            width: 250,
          ),
        ],
      ),
    );
  }
}

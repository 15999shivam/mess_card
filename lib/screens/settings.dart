import 'package:flutter/material.dart';
import 'package:mess_card/components/rounded_button.dart';

class Settings extends StatefulWidget {
  static String id = "setting";
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  String name;
  String rollno;
  String hostalName;
  String roomno;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: <Widget>[
          CircleAvatar(
            child: Image.asset('assets/logo.png'),
            radius: 60,
            foregroundColor: Colors.transparent,
            backgroundColor: Colors.transparent,
          ),
          SizedBox(
            height: 25,
          ),
          Card(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Opacity(
                    opacity: 0.7,
                    child: Text("Name"),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Nishant",
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ),
            elevation: 5,
            borderOnForeground: true,
            margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          ),
          SizedBox(
            height: 10,
          ),
          Card(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Opacity(
                    opacity: 0.7,
                    child: Text("Name"),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Nishant",
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ),
            elevation: 5,
            borderOnForeground: true,
            margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          ),
          SizedBox(
            height: 10,
          ),
          Card(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Opacity(
                    opacity: 0.7,
                    child: Text("Name"),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Nishant",
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ),
            elevation: 5,
            borderOnForeground: true,
            margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          ),
          SizedBox(
            height: 10,
          ),
          Card(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Opacity(
                    opacity: 0.7,
                    child: Text("Name"),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Nishant",
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ),
            elevation: 5,
            borderOnForeground: true,
            margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 8),
            child: RoundedButton(
                color: Colors.blue, function: null, text: "Change Password"),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 8),
            child: RoundedButton(
                color: Colors.red, function: null, text: "Log Out"),
          ),
        ],
      ),
    );
  }
}

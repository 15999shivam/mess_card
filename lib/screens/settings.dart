import 'package:flutter/material.dart';
import 'package:mess_card/components/rounded_button.dart';
import 'package:mess_card/networkig/user.dart' as user;
import 'changePassword.dart';

class Settings extends StatefulWidget {
  static String id = "setting";
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  String name;
  String username;
  String hostalName;
  String roomno;

  void startState() async {
    var userObject = await user.getUserDataFromLocalStorage();
    print(userObject);
    setState(() {
      name = userObject['name'];
      username = userObject['username'].toString();
      hostalName = userObject['hostelname'];
      roomno = userObject['roomno'];
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startState();
    name = "";
    username = "";
    hostalName = "";
    roomno = "";
  }

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
          CustomCard(title: "Name", val: name),
          SizedBox(
            height: 10,
          ),
          CustomCard(title: "Roll NO.", val: username),
          SizedBox(
            height: 10,
          ),
          CustomCard(title: "Hostel", val: hostalName),
          SizedBox(
            height: 10,
          ),
          CustomCard(title: "Room No.", val: roomno),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 8),
            child: RoundedButton(
                color: Colors.blue,
                function: () {
                  Navigator.pushNamed(context, ChangePassword.id);
                },
                text: "Change Password"),
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

class CustomCard extends StatelessWidget {
  const CustomCard({
    Key key,
    @required this.title,
    @required this.val,
  }) : super(key: key);

  final String title;
  final String val;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Opacity(
              opacity: 0.7,
              child: Text(title),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              val,
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
      elevation: 5,
      borderOnForeground: true,
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
    );
  }
}

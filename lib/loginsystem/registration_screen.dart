import 'package:flutter/material.dart';
import 'package:mess_card/components/rounded_button.dart';
import '../constants.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:mess_card/messcard/Card.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../utilities/utils.dart';

class RegistrationScreen extends StatefulWidget {
  static const String id = "registration_screen";
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  bool showSpinner = false;
  String email = "";
  String password = "";
  String name = "";
  String username;
  String hostalname = "Marcopolo Boys Hostal";
  String roomno;

  double UsernameErrorHeight = 0;
  double EmailErrorHeight = 0;
  double PasswordErrorHEight = 0;
  List<String> Hostals = ["Marcopolo Boys Hostal", "Vasco digama Boys Hostal"];

  void showUserNameError() {
    setState(() {
      UsernameErrorHeight = 25;
    });
  }

  void showPasswordError() {
    setState(() {
      PasswordErrorHEight = 25;
    });
  }

  void showEmailError() {
    setState(() {
      EmailErrorHeight = 25;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      backgroundColor: Colors.white,
//      resizeToAvoidBottomInset: true,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: ListView(
//            mainAxisAlignment: MainAxisAlignment.center,
//            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Hero(
                tag: 'logo',
                child: Container(
                  height: 200.0,
                  child: Image.asset('assets/logo.png'),
                ),
              ),
              SizedBox(
                height: 48.0,
              ),
              TextField(
                keyboardType: TextInputType.text,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  //Do something with the user input.
                  name = value;
                },
                decoration:
                    kTextFileDecoration.copyWith(hintText: "Enter Your Name"),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  //Do something with the user input.
                  username = value;
                },
                decoration: kTextFileDecoration.copyWith(
                    hintText: "Enter Your Username(Roll No.)"),
              ),
              AnimatedContainer(
                duration: Duration(milliseconds: 500),
                height: UsernameErrorHeight,
                child: Text(
                  "Provide a 10 digit username",
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  //Do something with the user input.
                  email = value;
                },
                decoration:
                    kTextFileDecoration.copyWith(hintText: "Enter Your Email"),
              ),
              AnimatedContainer(
                duration: Duration(milliseconds: 500),
                height: EmailErrorHeight,
                child: Text(
                  "Provide chitkara email id",
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                obscureText: true,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  //Do something with the user input.
                  password = value;
                },
                decoration: kTextFileDecoration.copyWith(
                    hintText: "Enter Your Password"),
              ),
              AnimatedContainer(
                duration: Duration(milliseconds: 500),
                height: PasswordErrorHEight,
                child: Text(
                  "Password must contain @,A-Z and 0-9",
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  //Do something with the user input.
                  roomno = value;
                },
                decoration: kTextFileDecoration.copyWith(
                    hintText: "Enter Your Room No."),
              ),
              SizedBox(
                height: 8.0,
              ),
              DropdownButton(
                items: Hostals.map((hostal) => DropdownMenuItem(
                      child: Text("$hostal"),
                      value: hostal,
                    )).toList(),
                onChanged: (val) {
                  print(val);
                  setState(() {
                    hostalname = val;
                  });
                },
                value: hostalname,
              ),
              SizedBox(
                height: 24.0,
              ),
              RoundedButton(
                color: Colors.blueAccent,
                function: () async {
                  bool isEmail = ValidateEmail(email);
                  bool isPassword = ValidatePassword(password);
                  bool isUsername = ValidateUsername(username.toString());
                  if (!isEmail || !isPassword || !isUsername) {
                    if (!isEmail) {
                      showEmailError();
                    }
                    if (!isPassword) {
                      showPasswordError();
                    }
                    if (!isUsername) {
                      showUserNameError();
                    }
                  } else {
                    setState(() {
                      showSpinner = true;
                    });
                    //try {
//                    final newUser = await _auth.createUserWithEmailAndPassword(
//                        email: email, password: password);
//                    if (newUser != null) {
                    Navigator.pushNamedAndRemoveUntil(
                        context, MessCard.id, (Route<dynamic> route) => false);
//                    }
//                    setState(() {
//                      showSpinner = false;
//                    });
//                  } catch (e) {
//                    setState(() {
//                      showSpinner = false;
//                    });
//                    print(e);
                    //}
                  }
                },
                text: 'Register',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

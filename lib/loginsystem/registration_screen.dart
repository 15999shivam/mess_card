import 'package:flutter/material.dart';
import 'package:mess_card/components/rounded_button.dart';
import '../constants.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
//import 'package:mess_card/messcard/Card.dart';
import '../utilities/utils.dart';
import '../components/CustomInput.dart';
import '../networkig/register.dart' as network;
//import 'package:mess_card/messcard/CardData.dart';
import 'package:mess_card/SplashScreen.dart';

class RegistrationScreen extends StatefulWidget {
  static const String id = "registration_screen";
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  bool showSpinner = false;
  String email = null;
  String password = null;
  String name = null;
  String username = null;
  String hostalname = "Select Your Hostel";
  String roomno = null;

  double UsernameErrorHeight = 0;
  double EmailErrorHeight = 0;
  double PasswordErrorHEight = 0;
  double nameErrorHeight = 0;
  double roomErrorHeight = 0;
  double hostalErrorHeight = 0;
  List<String> Hostals = [
    "Select Your Hostel",
    "Marcopolo Boys Hostel",
    "Vascodigama Boys Hostel",
    "Columbs Boys Hostel",
    "Armstrong Boys Hostel",
    "Pacassio Hostel",
    "Nightangle Hostel",
    "Pi(A) Hostel",
    "Pi(B) Hostel",
    "Pi(C) Hostel",
    "Machlin Boys Hostel",
  ];

  void showUserNameError() {
    setState(() {
      UsernameErrorHeight = 25;
    });
  }

  void showNameError() {
    setState(() {
      nameErrorHeight = 25;
    });
  }

  void showRoomError() {
    setState(() {
      roomErrorHeight = 25;
    });
  }

  void showPasswordError() {
    setState(() {
      PasswordErrorHEight = 30;
    });
  }

  void showEmailError() {
    setState(() {
      EmailErrorHeight = 25;
    });
  }

  void showHostalError() {
    setState(() {
      hostalErrorHeight = 25;
    });
  }

  void hideUserNameError() {
    setState(() {
      UsernameErrorHeight = 0;
    });
  }

  void hidePasswordError() {
    setState(() {
      PasswordErrorHEight = 0;
    });
  }

  void hideEmailError() {
    setState(() {
      EmailErrorHeight = 0;
    });
  }

  void hideRoomError() {
    setState(() {
      roomErrorHeight = 0;
    });
  }

  void hideNameError() {
    setState(() {
      nameErrorHeight = 0;
    });
  }

  void hideHostalError() {
    setState(() {
      hostalErrorHeight = 0;
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
              CustomInput(
                keyBoardType: TextInputType.text,
                setState: (val) {
                  name = val;
                },
                labelText: "Name",
                hintText: "Enter Your Name",
                filedName: name,
                errorHeight: nameErrorHeight,
                errormessage: "Please Provide Name",
              ),
              CustomInput(
                keyBoardType: TextInputType.number,
                hintText: "Enter Your Username(Roll No.)",
                labelText: "Enter Username",
                setState: (val) {
//                    print(val);
                  username = val;
                },
                filedName: username,
                errorHeight: UsernameErrorHeight,
                errormessage: "Provide a 10 digit username",
              ),
              CustomInput(
                keyBoardType: TextInputType.emailAddress,
                errorHeight: EmailErrorHeight,
                filedName: email,
                hintText: "Enter Your Email",
                labelText: "Email",
                setState: (val) {
                  email = val;
                },
                errormessage: "Provide chitkara email id",
              ),
              CustomInput(
                  keyBoardType: TextInputType.visiblePassword,
                  errormessage:
                      "Password must contain 1 special character,A-Z and 0-9",
                  setState: (val) {
                    password = val;
                  },
                  labelText: "Password",
                  hintText: "Enter Your Password",
                  filedName: password,
                  errorHeight: PasswordErrorHEight,
                  obsecure: true),
              CustomInput(
                errorHeight: roomErrorHeight,
                filedName: roomno,
                hintText: "Enter Your Room No.",
                labelText: "Room No.",
                setState: (val) {
                  roomno = val;
                },
                keyBoardType: TextInputType.number,
                errormessage: "Please Provide Room No.",
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32.0),
                  border: Border.all(
                      color: Colors.lightBlueAccent,
                      style: BorderStyle.solid,
                      width: 1),
                ),
                child: DropdownButton(
                  isExpanded: true,
                  underline: SizedBox(),
                  items: Hostals.map((hostal) => DropdownMenuItem(
                        child: Center(
                          child: Text(
                            "$hostal",
                            textAlign: TextAlign.center,
                          ),
                        ),
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
              ),
              AnimatedContainer(
                duration: Duration(milliseconds: 500),
                height: hostalErrorHeight,
                child: Text(
                  "Select Your Hostel",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14, color: Colors.red),
                ),
              ),
              SizedBox(
                height: 24.0,
              ),
              RoundedButton(
                color: Colors.blueAccent,
                function: () async {
                  print(name);
                  print(username);
                  print(email);
                  print(password);
                  print(roomno);

                  if ((email == null || email == "") ||
                      (username == null || username == "") ||
                      (password == null || password == "") ||
                      (name == null || name == "") ||
                      (roomno == null || roomno == "") ||
                      (hostalname == "Select Your Hostel")) {
                    if (email == null || email == "") {
                      showEmailError();
                    }
                    if (username == null || username == "") {
                      showUserNameError();
                    }
                    if (password == null || password == "") {
                      showPasswordError();
                    }
                    if (roomno == null || roomno == "") {
                      showRoomError();
                    }
                    if (name == null || name == "") {
                      showNameError();
                    }
                    if (hostalname == "Select Your Hostel") {
                      showHostalError();
                    }
                    if (hostalname != "Select Your Hostel") {
                      hideHostalError();
                    }
                    if (name != null && name != "") {
                      hideNameError();
                    }
                    if (roomno != null && roomno != "") {
                      hideRoomError();
                    }
                    if (email != null && email != "") {
//                      hideEmailError();
                      bool isEmail = ValidateEmail(email);
                      if (!isEmail) {
                        showEmailError();
                      }
                      if (isEmail) {
                        hideEmailError();
                      }
                    }
                    if (password != null && password != "") {
//                      hidePasswordError();
                      bool isPassword = ValidatePassword(password);
                      if (!isPassword) {
                        showPasswordError();
                      }
                      if (isPassword) {
                        hidePasswordError();
                      }
                    }
                    if (username != null && username != "") {
//                      hideUserNameError();
                      bool isUsername = ValidateUsername(username.toString());
                      if (!isUsername) {
                        showUserNameError();
                      }
                      if (isUsername) {
                        hideUserNameError();
                      }
                    }
                  } else {
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
                      if (isEmail) {
                        hideEmailError();
                      }
                      if (isPassword) {
                        hidePasswordError();
                      }
                      if (isUsername) {
                        hideUserNameError();
                      }
                    } else {
                      setState(() {
                        showSpinner = true;
                      });
                      try {
                        final res = await network.register({
                          'name': name,
                          'username': username,
                          'password': password,
                          'email': email,
                          'roomno': roomno,
                          'hostelname': hostalname
                        });
                        print("result of network call" + res.toString());
                        if (res == 1) {
                          Navigator.pushNamedAndRemoveUntil(context,
                              SplashScreen.id, (Route<dynamic> route) => false);
                        } else {}
                        setState(() {
                          showSpinner = false;
                        });
                      } catch (e) {
                        setState(() {
                          showSpinner = false;
                        });
                        print(e);
                      }
                    }
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

import 'package:flutter/material.dart';
import 'package:mess_card/components/rounded_button.dart';
import '../constants.dart';
//import 'package:mess_card/messcard/Card.dart';
//import 'package:mess_card/messcard/CardData.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:mess_card/utilities/utils.dart';
import 'package:mess_card/networkig/login.dart' as network;
import 'package:mess_card/components/CustomInput.dart';
import 'package:mess_card/SplashScreen.dart';

class LoginScreen extends StatefulWidget {
  static const String id = "login_screen";
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool showSpinner = false;
  String username;
  String password;

  double UsernameErrorHeight = 0;
  double PasswordErrorHEight = 0;

  void showUserNameError() {
    setState(() {
      UsernameErrorHeight = 25;
    });
  }

  void showPasswordError() {
    setState(() {
      PasswordErrorHEight = 30;
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      backgroundColor: Colors.white,
//      resizeToAvoidBottomPadding: true,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Flexible(
                child: Hero(
                  tag: 'logo',
                  child: Container(
                    height: 200.0,
                    child: Image.asset('assets/logo.png'),
                  ),
                ),
              ),
              SizedBox(
                height: 48.0,
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
                obsecure: true,
              ),
              RoundedButton(
                color: Colors.lightBlueAccent,
                function: () async {
                  print(username);
                  print(password);

                  if ((username == null || username == "") ||
                      (password == null || password == "")) {
                    if (username == null || username == "") {
                      showUserNameError();
                    }
                    if (password == null || password == "") {
                      showPasswordError();
                    }

                    if (password != null && password != "") {
                      bool isPassword = ValidatePassword(password);
                      if (!isPassword) {
                        showPasswordError();
                      }
                      if (isPassword) {
                        hidePasswordError();
                      }
                    }
                    if (username != null && username != "") {
                      bool isUsername = ValidateUsername(username.toString());
                      if (!isUsername) {
                        showUserNameError();
                      }
                      if (isUsername) {
                        hideUserNameError();
                      }
                    }
                  } else {
                    bool isPassword = ValidatePassword(password);
                    bool isUsername = ValidateUsername(username.toString());
                    if (!isPassword || !isUsername) {
                      if (!isPassword) {
                        showPasswordError();
                      }
                      if (!isUsername) {
                        showUserNameError();
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
                        final res = await network.login({
                          'username': username,
                          'password': password,
                        });
                        print("result of network call" + res.toString());
                        if (res == 1) {
                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            SplashScreen.id,
                            (Route<dynamic> route) => false,
                          );
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
                text: 'Log In',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

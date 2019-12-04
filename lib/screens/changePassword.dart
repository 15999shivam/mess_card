import 'package:flutter/material.dart';
import 'package:mess_card/components/rounded_button.dart';
import '../constants.dart';
//import 'package:mess_card/messcard/Card.dart';
//import 'package:mess_card/messcard/CardData.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:mess_card/utilities/utils.dart';
import 'package:mess_card/networkig/changePassword.dart' as network;
import 'package:mess_card/components/CustomInput.dart';
import 'settings.dart';

class ChangePassword extends StatefulWidget {
  static const String id = "change_password";
  @override
  _ChangePassword createState() => _ChangePassword();
}

class _ChangePassword extends State<ChangePassword> {
  bool showSpinner = false;
  String oldPassword;
  String newPassword;
  String confirmPassword;

  double oldPasswordErrorHeight = 0;
  double newPasswordErrorHeight = 0;
  double confirmPasswordErrorHeight = 0;

  void showOldPasswordError() {
    setState(() {
      oldPasswordErrorHeight = 30;
    });
  }

  void showNewPasswordError() {
    setState(() {
      newPasswordErrorHeight = 30;
    });
  }

  void showConfirmPasswordError() {
    setState(() {
      confirmPasswordErrorHeight = 25;
    });
  }

  void hideOldPasswordError() {
    setState(() {
      oldPasswordErrorHeight = 0;
    });
  }

  void hideNewPasswordError() {
    setState(() {
      newPasswordErrorHeight = 0;
    });
  }

  void hideConfirmPasswordError() {
    setState(() {
      confirmPasswordErrorHeight = 0;
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
                keyBoardType: TextInputType.visiblePassword,
                hintText: "Old PassWord",
                labelText: "Old Password",
                setState: (val) {
//                    print(val);
                  oldPassword = val;
                },
                filedName: oldPassword,
                errorHeight: oldPasswordErrorHeight,
                errormessage:
                    "Password must contain 1 special character,A-Z and 0-9",
                obsecure: true,
              ),
              CustomInput(
                keyBoardType: TextInputType.visiblePassword,
                hintText: "New Passsword",
                labelText: "New Passsword",
                setState: (val) {
//                    print(val);
                  newPassword = val;
                },
                filedName: newPassword,
                errorHeight: newPasswordErrorHeight,
                errormessage:
                    "Password must contain 1 special character,A-Z and 0-9",
                obsecure: true,
              ),
              CustomInput(
                keyBoardType: TextInputType.visiblePassword,
                errormessage: "Password didn't match",
                setState: (val) {
                  confirmPassword = val;
                },
                labelText: "Confirm Password",
                hintText: "Confirm Password",
                filedName: confirmPassword,
                errorHeight: confirmPasswordErrorHeight,
                obsecure: true,
              ),
              RoundedButton(
                color: Colors.lightBlueAccent,
                function: () async {
                  print(newPassword);
                  print(confirmPassword);
                  print(oldPassword);

                  if ((newPassword == null || newPassword == "") ||
                      (confirmPassword == null || confirmPassword == "") ||
                      (oldPassword == null || oldPassword == "")) {
                    if (newPassword == null || newPassword == "") {
                      showNewPasswordError();
                    }

                    if (oldPassword == null || oldPassword == "") {
                      showOldPasswordError();
                    }
                    if (oldPassword != null && oldPassword != "") {
                      bool isPassword = ValidatePassword(oldPassword);
                      if (!isPassword) {
                        showOldPasswordError();
                      }
                      if (isPassword) {
                        hideOldPasswordError();
                      }
                    }
                    if (newPassword != null && newPassword != "") {
                      bool isPassword = ValidatePassword(newPassword);
                      if (!isPassword) {
                        showNewPasswordError();
                      }
                      if (isPassword) {
                        hideNewPasswordError();
                      }
                    }

                    if (confirmPassword == null || confirmPassword == "") {
                      showConfirmPasswordError();
                    }
                    if (confirmPassword != newPassword ||
                        confirmPassword == null) {
//                      print("haan mai shi jaga phooch gya");
                      showConfirmPasswordError();
                    } else {
//                      print("haan mai hide krne jara hu ");
                      hideConfirmPasswordError();
                    }
                  } else {
                    bool isOldPassword = ValidatePassword(oldPassword);
                    bool isNewPassword = ValidatePassword(newPassword);
                    if (!isOldPassword ||
                        !isNewPassword ||
                        confirmPassword != newPassword) {
                      print("hii mai chal raa huuuuu");
                      if (!isNewPassword) {
                        showNewPasswordError();
                      }
                      if (!isOldPassword) {
                        showOldPasswordError();
                      }

                      if (isOldPassword) {
                        print("hiding oldpassword warning");
                        hideOldPasswordError();
                      }
                      if (isNewPassword) {
                        hideNewPasswordError();
                      }
                      if (confirmPassword != newPassword) {
                        print("haan mai shi jaga phooch gya");
                        showConfirmPasswordError();
                      } else {
                        print("haan mai hide krne jara hu ");
                        hideConfirmPasswordError();
                      }
                    } else {
                      setState(() {
                        showSpinner = true;
                      });
                      try {
                        //TODO: Do network call for change password
                        final res = await network.changePassword({
                          'oldpassword': oldPassword,
                          'newpassword': newPassword,
                        });
                        print("result of network call" + res.toString());
                        if (res == 1) {
                          Navigator.of(context).pop();
                        } else {
                          //TODO:put error alerts here!
                        }
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

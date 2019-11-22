import 'package:flutter/material.dart';
import 'package:mess_card/constants.dart';

class CustomInput extends StatefulWidget {
  CustomInput(
      {this.filedName,
      this.errorHeight,
      this.hintText,
      this.labelText,
      this.setState,
      this.errormessage,
      this.obsecure,
      this.keyBoardType});
  final String filedName;
  final String labelText;
  final String hintText;
  final double errorHeight;
  final Function setState;
  final String errormessage;
  final bool obsecure;
  final keyBoardType;

  @override
  _CustomInputState createState() => _CustomInputState();
}

class _CustomInputState extends State<CustomInput> {
  String filedName;
  bool obsecure;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    filedName = widget.filedName;
    obsecure = widget.obsecure == null ? false : widget.obsecure;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        FocusScope(
          child: Focus(
            onFocusChange: (val) {
              print('focus changed');
//              print(filedName);
              if (filedName == "123") {
//                print('hi 123');
                setState(() {
                  filedName = "";
                });
              } else if (filedName == "") {
//                print('hi ""');
                setState(() {
                  filedName = null;
                });
              }
//              else {
////                print('hi usename');
//                widget.setState(filedName);
//              }
            },
            child: TextField(
              obscureText: obsecure,
              keyboardType: widget.keyBoardType,
              textAlign: TextAlign.center,
              onTap: () {
                filedName = "123";
              },
              onChanged: (value) {
                //Do something with the user input.
                widget.setState(value);
              },
              decoration: kTextFileDecoration.copyWith(
                labelText: filedName != null ? widget.labelText : null,
                hintText: filedName == null ? widget.hintText : null,
              ),
            ),
          ),
        ),
        AnimatedContainer(
          duration: Duration(milliseconds: 500),
          height: widget.errorHeight,
          child: Text(
            "${widget.errormessage}",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14, color: Colors.red),
          ),
        ),
        SizedBox(
          height: 8.0,
        ),
      ],
    );
  }
}

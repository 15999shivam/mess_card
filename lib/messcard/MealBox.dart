import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MealBox extends StatelessWidget {
  MealBox({this.isChecked, this.onChange});
  final isChecked;
  final Function onChange;
  @override
  Widget build(BuildContext context) {
    return Checkbox(
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      onChanged: (val) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            // return object of type Dialog
            return AlertDialog(
                title: Text("Alert Dialog title"),
                content: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      FlatButton(
                        onPressed: () async {
                          http.Response res = await http
                              .get(Uri.parse("http://192.168.43.238:8080"));
                          print(res.body.toString());
                          onChange(true);
                          Navigator.of(context).pop();
                        },
                        child: Container(
                          child: Text(
                            'Yes',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                      FlatButton(
                        onPressed: () {
                          print("No");
                          Navigator.of(context).pop();
                        },
                        child: Container(
                          child: Text(
                            'No',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      )
                    ],
                  ),
                ));
          },
        );
      },
      value: isChecked,
    );
  }
}
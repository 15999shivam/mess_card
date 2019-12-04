import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

SharedPreferences prefs;
Future<dynamic> getUserDataFromLocalStorage() async {
  if (await getInstance() == 0) {
    return null;
  }
  dynamic user = jsonDecode(prefs.getString('user'));
  print("the user");
  print(user);
  return user;
}

Future<int> getInstance() async {
  try {
    prefs = await SharedPreferences.getInstance();
  } catch (e) {
    print("get instance problem");
    print(e);
    return 0;
  }
  return 1;
}

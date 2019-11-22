import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

const String PORT = "3000";

var url = 'http://192.168.43.238:$PORT/';
SharedPreferences prefs;
Future<int> login(body) async {
  print(body.toString());
  Map<String, String> headers = {"Content-type": "application/json"};
  var response = await http.post(url + "user/login",
      headers: headers, body: jsonEncode(body));
  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');
  try {
    var res = jsonDecode(response.body);
    print("resut");
    print(res);
    print(response.body == "{}");
    if (response.body == "{}") {
      return 0;
    }
    if (res['error'] != null) {
      return res['error'];
    }
    print(res['user']);
    if (await getInstance() == 0) {
      return 0;
    }
    if (await saveToken(res['token']) == 0) {
      return 0;
    }
    if (await saveUser(res['user']) == 0) {
      return 0;
    }
    if (await deleteMessCard() == 0) {
      return 0;
    }
  } catch (e) {
    print("haan mai hoon khalnayak");
    print(e);
    return 0;
  }
  return 1;
//  print(await http.read('http://example.com/foobar.txt'));
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

Future<int> saveToken(token) async {
  try {
    print(jsonEncode(token));
    await prefs.setString('token', jsonEncode(token));
  } catch (e) {
    print("save token problem");
    print(e);
    return 0;
  }
  return 1;
}

Future<int> saveUser(user) async {
  try {
    await prefs.setString('user', jsonEncode(user));
  } catch (e) {
    print("save User problem");
    print(e);
    return 0;
  }
  return 1;
}

Future<int> deleteMessCard() async {
  try {
    await prefs.remove('messcard');
  } catch (e) {
    print("delete mess card problem");
    print(e);
    return 0;
  }
  return 1;
}

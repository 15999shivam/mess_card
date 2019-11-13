import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

var url = 'http://192.168.43.238:8080/';
SharedPreferences prefs;

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

Future<int> authentictae() async {
  try {
    final result = await InternetAddress.lookup('google.com');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      print('connected google');

      try {
        final result = await InternetAddress.lookup('192.168.43.238');
        if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
          print('connected our');

          if (await getInstance() == 0) {
            return 0;
          }
          var res;
          try {
            String token = prefs.getString('token');
            print(token);
            var response = await http.get(
              url + "user/auth",
              headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
            );
            print('Response status: ${response.statusCode}');
            print('Response body: ${response.body}');

            res = jsonDecode(response.body);
            if (res['error'] != null) {
              return res['error'];
            }
          } catch (e) {
            return 0;
          }
          return res['sucess'];
        } else {
          return 0;
        }
      } on SocketException catch (_) {
        print('not connected');
      }
    } else {
      return 0;
    }
  } on SocketException catch (_) {
    print('not connected');
    return 0;
  }

//  print(await http.read('http://example.com/foobar.txt'));
}

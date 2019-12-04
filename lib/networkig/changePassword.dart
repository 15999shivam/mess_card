import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

const String PORT = "3000";
var url = 'http://192.168.43.238:$PORT/';
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

Future<int> changePassword(body) async {
  print(body);
  try {
    final result = await InternetAddress.lookup('google.com');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      print('connected google');

      try {
        final result = await InternetAddress.lookup('192.168.43.238');
        if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
          print('connected our');

          var res;
          try {
            if (await getInstance() == 0) {
              return 0;
            }
            var token = prefs.getString('token');
//            token ??= "shivam";

            if (token == null) {
              print("i am inside token null");
              return 0;
            }
            token = jsonDecode(token);
            token = "Bearer $token";
            print(token);
            var response;
            print(jsonEncode(body));
//            Map<String, String> headers = {"Content-type": "application/json"};
            response = await http.post(
              url + "user/changepassword",
              headers: {
                HttpHeaders.authorizationHeader: token,
                "Content-type": "application/json"
              },
              body: jsonEncode(body),
            );
            print('Response status: ${response.statusCode}');
            print('Response body: ${response.body}');

            res = jsonDecode(response.body);
            if (res['error'] != null) {
              print("i reached line 58");
              return 0;
            }
            print("i reached line 91");
            return res["sucess"];
          } catch (e) {
            print(e);
            print("i reached line 86");
            return 0;
          }
        } else {
          print("i reached line 95");
          return 0;
        }
      } on SocketException catch (_) {
        print('not connected ours');
      }
    } else {
      print("i reached line 103");
      return 0;
    }
  } on SocketException catch (_) {
    print("i reached line 109");
    print('not connected google');
    return 0;
  }
  //only for the sake of removal of warning...
  return 0;
//  print(await http.read('http://example.com/foobar.txt'));
}

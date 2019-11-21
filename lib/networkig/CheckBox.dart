import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mess_card/messcard/CardData.dart';

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

Future<int> checkBox(body) async {
  print(json.encode(body));
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
          var data;
          try {
            String token = prefs.getString('token');
            var messcard = prefs.getString('messcard');

            if (messcard == null) {
              data = CardData.DummyData;
            } else {
              data = jsonDecode(messcard);
            }
//            print(token);
            token = "Bearer ${jsonDecode(token)}";
            print(token);
//            Map<String, String> headers = {"Content-type": "application/json"};
            var response = await http.post(
              url + "user/checkbox",
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
              return res['error'];
            }
          } catch (e) {
            return 0;
          }
          data[body['day'] - 1][body['meal']] = true;
          prefs.setString('messcard', jsonEncode(data));
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

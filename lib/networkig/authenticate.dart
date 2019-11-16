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

Future<CardData> authentictae() async {
  try {
    final result = await InternetAddress.lookup('google.com');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      print('connected google');

      try {
        final result = await InternetAddress.lookup('192.168.43.238');
        if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
          print('connected our');

          if (await getInstance() == 0) {
            return CardData(data: [
              [false]
            ]);
          }
          var res;
          try {
            String token = prefs.getString('token');
//            print(token);
            token = "Bearer ${jsonDecode(token)}";
            print(token);
            var response = await http.get(
              url + "user/auth",
              headers: {HttpHeaders.authorizationHeader: token},
            );
            print('Response status: ${response.statusCode}');
            print('Response body: ${response.body}');

            res = jsonDecode(response.body);
            if (res['error'] != null) {
              return res['error'];
            }
          } catch (e) {
            return CardData(data: [
              [false]
            ]);
          }
          print('mai data print kar raha hu');
          print(res['data']);

          return CardData(data: res['data']);
          ;
        } else {
          return CardData(data: [
            [false]
          ]);
        }
      } on SocketException catch (_) {
        print('not connected');
      }
    } else {
      return CardData(data: [
        [false]
      ]);
    }
  } on SocketException catch (_) {
    print('not connected');
    return CardData(data: [
      [false]
    ]);
  }

//  print(await http.read('http://example.com/foobar.txt'));
}

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
          var data;
          try {
            var token = prefs.getString('token');

//            token ??= "shivam";

            if (token == null) {
              print("i am inside token null");
              prefs.remove('messcard');
              return CardData(data: [
                [false]
              ]);
            }
            token = jsonDecode(token);
            String messcard = prefs.getString('messcard');
            print(messcard == null);
            print(messcard);

            print(token);
            token = "Bearer $token";
            print(token);
            var response;
            print(messcard);
            if (messcard == null) {
              print("mai null ke ander ghusss gya huuu");
              response = await http.get(
                url + "user/auth",
                headers: {HttpHeaders.authorizationHeader: token},
              );
              print('Response status: ${response.statusCode}');
              print('Response body: ${response.body}');

              res = jsonDecode(response.body);
              if (res['error'] != null) {
                print("i reached line 58");
                return CardData(data: [
                  [false]
                ]);
              }
              data = res['data'];
              prefs.setString('messcard', jsonEncode(data));
            } else {
              data = jsonDecode(messcard);
              response = await http.get(
                url + "user/authLocal",
                headers: {HttpHeaders.authorizationHeader: token},
              );
              print('Response status: ${response.statusCode}');
              print('Response body: ${response.body}');

              res = jsonDecode(response.body);
              if (res['error'] != null) {
                print("i reached line 75");
                return CardData(data: [
                  [false]
                ]);
              }
              print("i reached line 79");
//              data = messcard;
              if (res['day'] == 1) {
                data = CardData.DummyData;
              }
              data[res['day'] - 1] = res['data'];
              prefs.setString('messcard', jsonEncode(data));
            }
          } catch (e) {
            print(e);
            print("i reached line 86");
            return CardData(data: [
              [false]
            ]);
          }
          print("i reached line 91");
          return CardData(data: data, day: res['day']);
        } else {
          print("i reached line 95");
          return CardData(data: [
            [false]
          ]);
        }
      } on SocketException catch (_) {
        print('not connected ours');
      }
    } else {
      print("i reached line 103");
      return CardData(data: [
        [false]
      ]);
    }
  } on SocketException catch (_) {
    print("i reached line 109");
    print('not connected google');
    return CardData(data: [
      [false]
    ]);
  }
  //only for the sake of removal of warning...
  return CardData(data: [
    [false]
  ]);
//  print(await http.read('http://example.com/foobar.txt'));
}

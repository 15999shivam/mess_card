import 'package:http/http.dart' as http;
import 'dart:convert';

var url = 'http://';
var response = await http.post(url, body: {'name': 'doodle', 'color': 'blue'});
print('Response status: ${response.statusCode}');
print('Response body: ${response.body}');

print(await http.read('http://example.com/foobar.txt'));
import 'package:http/http.dart';
import 'dart:convert';

String baseUrl = 'http://optimalfire.com/touqeer/crud-api';

Future<dynamic> loginUser(data) async {
  // make Post  request
  Response response = await post(baseUrl +  '/login', body: data);
  return jsonDecode(response.body);
}

Future<dynamic> register(user) async {
  // make POST request
  print(user);
  Response response = await post(baseUrl +  '/register', body: user);
  return jsonDecode(response.body);
}

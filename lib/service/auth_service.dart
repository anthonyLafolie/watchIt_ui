import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:watch_it/common/constant.dart';

class AuthService {
  Future<http.Response> login(username, password) async {
    return await http.post(
      Uri.parse(baseUrl + "auth/login"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(<String, String>{
        'username': username,
        'password': password,
      }),
    );
  }

  Future<http.Response> signup(username, email, password) async {
    return await http.post(
      Uri.parse(baseUrl + "auth/signup"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(<String, String>{
        'username': username,
        'email': email,
        'password': password,
      }),
    );
  }
}

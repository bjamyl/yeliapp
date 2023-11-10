import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Auth with ChangeNotifier {
  String? _token;
  String? _refreshToken;
  DateTime? _expiryDate;

  Map<String, String> signupData = {
    "first_name": "",
    "last_name": "",
    "email": "",
    "password": "",
    "re_password": ""
  };

  //Method for creating a new user
  Future<void> signup() async {
    print('object');
    final url = Uri.parse("http://10.0.2.2:8000/api/users/");
    try {
      final res = await http.post(url,
          headers: {'Content-Type': 'application/json'},
          body: json.encode(signupData));
      final resBody = json.decode(res.body);
      print(resBody);
    } catch (e) {
      rethrow;
    }
  }
}

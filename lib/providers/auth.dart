import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/http_exceptions.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class Auth with ChangeNotifier {
  String? _token;
  String? userFirstName;
  String? _refreshToken;
  DateTime? _expiryDate;

  Map<String, String> signupData = {
    "first_name": "",
    "last_name": "",
    "email": "",
    "password": "",
    "re_password": ""
  };

  Map<String, String> loginData = {"email": "", "password": ""};

  //Method for creating a new user
  Future<void> signup() async {
    final url = Uri.parse("http://10.0.2.2:8000/api/users/");
    try {
      final res = await http.post(url,
          headers: {'Content-Type': 'application/json'},
          body: json.encode(signupData));
      final resBody = json.decode(res.body);
    } catch (e) {
      rethrow;
    }
  }

  //Method for handling login functionality. Returns a refresh and access token from JWT endpoint
  Future<void> signin() async {
    final url = Uri.parse('http://10.0.2.2:8000/api/jwt/create/');
    try {
      final res = await http.post(url,
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: json.encode({
            "email": signupData["email"],
            "password": signupData["password"]
          }));
      final responseBody = json.decode(res.body);
      //Checking to see if the login response has any errors in the response body
      if (responseBody['detail'].toString().contains('No active account')) {
        throw HttpException(responseBody["detail"]);
      }
      _token = responseBody['access'];
      _refreshToken = responseBody['refresh'];
      _expiryDate = DateTime.now().add(const Duration(seconds: 250));
      notifyListeners();
      Map<String, dynamic> decodedToken = JwtDecoder.decode(_token!);
      userFirstName = decodedToken["first_name"];

      print('We have joy!!');
    } catch (e) {
      rethrow;
    }
  }
}

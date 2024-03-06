import 'package:flutter/material.dart';

import 'package:trafficticket_management/model/user.dart';

import 'package:http/http.dart' as http;
import 'package:trafficticket_management/util/constants.dart';
import 'package:trafficticket_management/util/util.dart';

class AuthService {
  late User _tempUser;
  late String _tempEmail = 's';
  Future<void> signUpUser({
    required BuildContext context,
    required String fullname,
    required String email,
    required String mobile,
  }) async {
    try {
      _tempUser = User(
        id: '',
        fullname: fullname,
        email: email,
        mobile: mobile,
        token: '',
      );

      _tempEmail = email;

      http.Response res = await http.post(
        Uri.parse('${Constants.uri}/signup'),
        body: _tempUser.toJson(),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          showSnackBar(context, 'Created');
          Navigator.pushReplacementNamed(context, '/password_setup',
              arguments: _tempUser);
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  Future<void> setPassword(
      {required BuildContext context,
      required User tempUser,
      required String otp,
      required String password,
      required String confirmPassword}) async {
    try {
      http.Response res = await http.post(
        Uri.parse('${Constants.uri}/setPassword'),
        body: {
          'email': tempUser.email,
          'otp': otp,
          'password': password,
          'confirmPassword': confirmPassword
        },
        headers: <String, String>{
          'Content-Type': 'application/x-www-form-urlencoded',
        },
      );
      print(_tempEmail);

      print('Response status code: ${res.statusCode}');
      print('Response body: ${res.body}');

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          showSnackBar(context, 'Account Created');
          Navigator.pushReplacementNamed(context, '/login');
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

//   Future<void> loginUser({

//   })
// async }
}

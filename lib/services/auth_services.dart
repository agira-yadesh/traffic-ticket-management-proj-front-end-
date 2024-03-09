import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:trafficticket_management/model/user.dart';

import 'package:http/http.dart' as http;
import 'package:trafficticket_management/pages/homePage.dart';
import 'package:trafficticket_management/pages/login.dart';

import 'package:trafficticket_management/pages/setPassword.dart';
import 'package:trafficticket_management/providers/user_provider.dart';
import 'package:trafficticket_management/util/constants.dart';
import 'package:trafficticket_management/util/util.dart';

class AuthService {
  late User _tempUser;

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
        tickets: [],
      );

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
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SetPasswordPage(argument: _tempUser),
            ),
          );
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

      print('Response status code: ${res.statusCode}');
      print('Response body: ${res.body}');

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          showSnackBar(context, 'Account Created');
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => LoginPage(),
            ),
          );
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  // void signInUser({
  //   required BuildContext context,
  //   required String email,
  //   required String password,
  // }) async {
  //   final navigator = Navigator.of(context);

  //   http.post(
  //     Uri.parse('${Constants.uri}/login'),
  //     body: jsonEncode({
  //       'email': email,
  //       'password': password,
  //     }),
  //     headers: <String, String>{
  //       'Content-Type': 'application/json; charset=UTF-8',
  //     },
  //   ).then((http.Response res) {
  //     httpErrorHandle(
  //       response: res,
  //       context: context,
  //       onSuccess: () async {
  //         showSnackBar(context, 'Account Created');

  //         SharedPreferences prefs = await SharedPreferences.getInstance();
  //         await prefs.setString('x-auth-token', jsonDecode(res.body)['token']);
  //         await prefs.setString('user_data', res.body);

  //         navigator.pushAndRemoveUntil(
  //           MaterialPageRoute(
  //             builder: (context) => const HomePage(),
  //           ),
  //           (route) => false,
  //         );
  //       },
  //     );
  //   }).catchError((e) {
  //     showSnackBar(context, e.toString());
  //   });
  // }

  void signInUser({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      var userProvider = Provider.of<UserProvider>(context, listen: false);
      final navigator = Navigator.of(context);
      http.Response res = await http.post(
        Uri.parse('${Constants.uri}/login'),
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      httpErrorHandle(
        response: res,
        // ignore: use_build_context_synchronously
        context: context,
        onSuccess: () async {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          userProvider.setUser(res.body);
          await prefs.setString('x-auth-token', jsonDecode(res.body)['token']);
          navigator.pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context) => const HomePage(),
            ),
            (route) => false,
          );
        },
      );
    } catch (e) {
      // ignore: use_build_context_synchronously
      showSnackBar(context, e.toString());
    }
  }

  void getUserData(
    BuildContext context,
  ) async {
    try {
      var userProvider = Provider.of<UserProvider>(context, listen: false);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('x-auth-token');
      print(token);

      if (token == null) {
        prefs.setString('x-auth-token', '');
      }

      var tokenRes = await http.post(
        Uri.parse('${Constants.uri}/tokenIsValid'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': token!
        },
      );
      var response = jsonDecode(tokenRes.body);
      print(response);

      if (response == true) {
        http.Response userRes = await http.get(
          Uri.parse('${Constants.uri}/'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'x-auth-token': token
          },
        );
        userProvider.setUser(userRes.body);
        print(userRes.body);
      }
    } catch (e) {
      // ignore: use_build_context_synchronously
      showSnackBar(context, e.toString());
    }
  }
}

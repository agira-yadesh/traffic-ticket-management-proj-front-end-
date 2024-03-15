import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:trafficticket_management/model/user.dart';

import 'package:http/http.dart' as http;
import 'package:trafficticket_management/pages/homePage.dart';
import 'package:trafficticket_management/pages/login.dart';
import 'package:trafficticket_management/pages/newPassword.dart';

import 'package:trafficticket_management/pages/setPassword.dart';
import 'package:trafficticket_management/pages/success.dart';
import 'package:trafficticket_management/pages/ticketHistory.dart';
import 'package:trafficticket_management/pages/verifyOtp.dart';
import 'package:trafficticket_management/pages/viewProfile.dart';
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
      // ignore: use_build_context_synchronously
      showSnackBar(context, e.toString());
    }
  }

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

  void signOut(BuildContext context) async {
    final navigator = Navigator.of(context);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('x-auth-token', '');
    navigator.pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => LoginPage(),
        ),
        (route) => false);
  }

  void changePassword({
    required BuildContext context,
    required String oldPassword,
    required String newPassword,
    required String confirmPassword,
  }) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('x-auth-token');

      http.Response res = await http.put(
        Uri.parse('${Constants.uri}/changePassword'),
        body: {
          'oldPassword': oldPassword,
          'newPassword': newPassword,
          'confirmPassword': confirmPassword,
        },
        headers: <String, String>{
          'Content-Type': 'application/x-www-form-urlencoded',
          'x-auth-token': token!
        },
      );

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          showSnackBar(context, 'Password Changed');
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomePage(),
            ),
          );
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  void editProfile({
    required BuildContext context,
    required String DOB,
    required String DL,
    required String phone,
    required String fax,
    required String company,
  }) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('x-auth-token');
      print(company);

      http.Response res = await http.put(
        Uri.parse('${Constants.uri}/editProfile'),
        body: {
          'dateOfBirth': DOB,
          'drivingLicense': DL,
          'company': company,
          'phone': phone,
          'fax': fax,
        },
        headers: <String, String>{
          'Content-Type': 'application/x-www-form-urlencoded',
          'x-auth-token': token!
        },
      );
      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          // showSnackBar(context, 'Profile Updated');
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SuccessProfile(),
            ),
          );
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  void viewProfile({
    required BuildContext context,
  }) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('x-auth-token');

      http.Response res = await http.get(
        Uri.parse('${Constants.uri}/profile'),
        headers: <String, String>{
          'Content-Type': 'application/x-www-form-urlencoded',
          'x-auth-token': token!
        },
      );

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          print(res.body);
          var userData = res.body;
          print(userData);
          print('hiii');

          // showSnackBar(context, 'Profile');
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  ViewProfile(userData: json.decode(userData)),
            ),
          );
        },
      );
    } catch (e) {
      print(e);
      showSnackBar(context, e.toString());
    }
  }

  void forgotPassword({
    required BuildContext context,
    required String email,
  }) async {
    try {
      http.Response res = await http.post(
        Uri.parse('${Constants.uri}/forgetPassword'),
        body: {
          'email': email,
        },
        headers: <String, String>{
          'Content-Type': 'application/x-www-form-urlencoded'
        },
      );
      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () async {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setString('x-auth-token', jsonDecode(res.body)['token']);

          showSnackBar(context, 'Enter Otp');
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => VerifyOtp(),
            ),
          );
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  void verifYOtp({
    required BuildContext context,
    required String otp,
  }) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('x-auth-token');

      http.Response res = await http.put(
        Uri.parse('${Constants.uri}/verifyOTP'),
        body: {
          'otp': otp,
        },
        headers: <String, String>{
          'Content-Type': 'application/x-www-form-urlencoded',
          'x-auth-token': token!
        },
      );
      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          showSnackBar(context, 'Set New Password');
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => NewPassword(),
            ),
          );
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  void newPassword({
    required BuildContext context,
    required String newPassword,
    required String confirmPassword,
  }) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('x-auth-token');
      http.Response res = await http.put(
        Uri.parse('${Constants.uri}/resetPassword'),
        body: {
          'password': newPassword,
          'confirmPassword': confirmPassword,
        },
        headers: <String, String>{
          'Content-Type': 'application/x-www-form-urlencoded',
          'x-auth-token': token!
        },
      );

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          showSnackBar(context, 'Password Changed');
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

  void ticketHistory({
    required BuildContext context,
  }) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('x-auth-token');

      http.Response res = await http.get(
        Uri.parse('${Constants.uri}/ticketHistory'),
        headers: <String, String>{
          'Content-Type': 'application/x-www-form-urlencoded',
          'x-auth-token': token!
        },
      );

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          print(res.body);
          var userTickets = res.body;
          final Map<String, dynamic> data = json.decode(userTickets);
          final List<dynamic> tickets = data['ticket'];

          print(userTickets);
          print('hiii');

          // showSnackBar(context, 'Profile');
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TicketHistory(userTickets: tickets),
            ),
          );
        },
      );
    } catch (e) {
      print(e);
    }
  }
}

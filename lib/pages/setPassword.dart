import 'package:flutter/material.dart';
import 'package:trafficticket_management/components/button.dart';
import 'package:trafficticket_management/components/textField.dart';
import 'package:trafficticket_management/model/user.dart';

import 'package:trafficticket_management/services/auth_services.dart';

class SetPasswordPage extends StatelessWidget {
  SetPasswordPage({super.key});

  final otpController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmpasswordController = TextEditingController();
  final AuthService authService = AuthService();

  void setPassword(BuildContext context) {
    final User _tempUser = ModalRoute.of(context)?.settings.arguments as User;

    print('Set Password button tapped');

    authService.setPassword(
      context: context,
      otp: otpController.text,
      password: passwordController.text,
      confirmPassword: confirmpasswordController.text,
      tempUser: _tempUser,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 238, 239, 240),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 10.0),
                child: IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/signup');
                  },
                ),
              ),
              const SizedBox(height: 30),
              const Center(
                child: Text(
                  'Set Password',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ),
              const SizedBox(height: 30),
              MyTextField(
                  controller: otpController,
                  hintText: 'Enter OTP received in your email',
                  obscureText: false),
              const SizedBox(height: 20),
              MyTextField(
                  controller: passwordController,
                  hintText: 'password',
                  obscureText: true),
              const SizedBox(height: 20),
              MyTextField(
                  controller: confirmpasswordController,
                  hintText: 'confirm password',
                  obscureText: true),
              const SizedBox(height: 20),
              MyButton(onTap: () => setPassword(context), text: 'Set Password')
            ],
          ),
        ),
      ),
    );
  }
}

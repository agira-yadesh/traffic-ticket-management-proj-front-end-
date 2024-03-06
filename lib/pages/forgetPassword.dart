import 'package:flutter/material.dart';
import 'package:trafficticket_management/components/button.dart';
import 'package:trafficticket_management/components/square_tile.dart';
import 'package:trafficticket_management/components/textField.dart';
import 'package:trafficticket_management/pages/login.dart';
import 'package:trafficticket_management/pages/signup.dart';
import 'package:trafficticket_management/pages/verifyOtp.dart';

class ForgetPassword extends StatelessWidget {
  ForgetPassword({super.key});

  final emailController = TextEditingController();
  void forgotPassword() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 238, 239, 240),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(left: 10.0),
              child: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/login');
                },
              ),
            ),
            const SizedBox(height: 30),
            const Center(
              child: Text(
                'Forgot Password',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ),
            const SizedBox(height: 70),
            Column(
              children: [
                const Center(
                  child: Text(
                    'Enter Email Address',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 16),
                  ),
                ),
                const SizedBox(height: 30),
                MyTextField(
                    controller: emailController,
                    hintText: 'example@gmail.com',
                    obscureText: false),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  },
                  child: const Text(
                    'Back to log in',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 14),
                  ),
                ),
                const SizedBox(height: 30),
                MyButton(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => VerifyOtp()),
                      );
                    },
                    text: 'Send'),
                const SizedBox(height: 50),
                Text(
                  'Or',
                  style: TextStyle(
                      color: Color.fromARGB(255, 4, 33, 196),
                      fontWeight: FontWeight.w500,
                      fontSize: 16),
                ),
                const SizedBox(height: 30),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SquareTile(imagePath: 'lib/images/google.png'),
                    SizedBox(
                      width: 20,
                    ),
                    SquareTile(imagePath: 'lib/images/facebook.png'),
                  ],
                ),
                const SizedBox(height: 30),
                Text(
                  'Do you have an account ?',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 14),
                ),
                const SizedBox(height: 20),
                MyVisibleButton(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignupPage()),
                      );
                    },
                    text: 'Sign Up')
              ],
            ),
          ],
        ),
      ),
    );
  }
}

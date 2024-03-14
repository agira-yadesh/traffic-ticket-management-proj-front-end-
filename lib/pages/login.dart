import 'package:flutter/material.dart';
import 'package:trafficticket_management/components/button.dart';
import 'package:trafficticket_management/components/square_tile.dart';
import 'package:trafficticket_management/components/textField.dart';
import 'package:trafficticket_management/pages/forgetPassword.dart';
import 'package:trafficticket_management/pages/signup.dart';
import 'package:trafficticket_management/services/auth_services.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final AuthService authService = AuthService();

  void loginUser(BuildContext context) {
    authService.signInUser(
        context: context,
        email: emailController.text,
        password: passwordController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 238, 239, 240),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(left: 10.0),
              child: Image.asset(
                'lib/images/logo.png',
                width: 100,
                height: 100,
              ),
            ),
            const SizedBox(height: 30),
            const Center(
              child: Text(
                'Login to Account',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ),
            const SizedBox(height: 30),
            MyTextField(
              controller: emailController,
              hintText: 'Email',
              obscureText: false, enabled: true, label: '',
            ),
            const SizedBox(height: 20),
            MyTextField(
              controller: passwordController,
              hintText: 'Password',
              obscureText: true, enabled: true, label: '',
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ForgetPassword()),
                      );
                    },
                    child: const Text(
                      'Forgot Password?',
                      style: TextStyle(
                          color: Color.fromARGB(255, 4, 33, 196),
                          fontWeight: FontWeight.w800),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            MyButton(
              text: 'Login',
              onTap: () => loginUser(context),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Row(
                children: [
                  Expanded(
                    child: Divider(
                      color: Colors.grey[400],
                      thickness: 0.5,
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  const Text('Or Login with'),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: Divider(
                      color: Colors.grey[400],
                      thickness: 0.5,
                    ),
                  ),
                ],
              ),
            ),
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
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Don't have an account?",
                  style: TextStyle(color: Colors.black),
                ),
                const SizedBox(
                  width: 5,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignupPage()),
                    );
                  },
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(
                        color: Color.fromARGB(255, 4, 33, 196),
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            )
          ],
        ),
      )),
    );
  }
}

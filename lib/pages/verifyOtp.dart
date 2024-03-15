import 'package:flutter/material.dart';
import 'package:trafficticket_management/components/button.dart';
import 'package:trafficticket_management/components/square_tile.dart';
import 'package:trafficticket_management/components/textField.dart';
import 'package:trafficticket_management/pages/forgetPassword.dart';
import 'package:trafficticket_management/pages/signup.dart';
import 'package:trafficticket_management/services/auth_services.dart';

class VerifyOtp extends StatelessWidget {
  VerifyOtp({super.key});
  final AuthService authService = AuthService();

  final otpController = TextEditingController();
  void verifyOtp(BuildContext context) {
    authService.verifYOtp(context: context, otp: otpController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 238, 239, 240),
      ),
      backgroundColor: const Color.fromARGB(255, 238, 239, 240),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                const Center(
                  child: Text(
                    'Verify OTP',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ),
                const SizedBox(height: 30),
                Column(
                  children: [
                    const Center(
                      child: Text(
                        'Enter Verification Code',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 16),
                      ),
                    ),
                    const SizedBox(height: 30),
                    MyTextField(
                      controller: otpController,
                      hintText: 'Enter the OTP',
                      obscureText: false,
                      enabled: true,
                      label: '',
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Didn't receive OTP?",
                          style: TextStyle(color: Colors.black),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ForgetPassword()),
                            );
                          },
                          child: const Text(
                            'Resend',
                            style: TextStyle(
                                color: Color.fromARGB(255, 4, 33, 196),
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    MyButton(
                        onTap: () {
                          verifyOtp(context);
                        },
                        text: 'Verify'),
                    const SizedBox(height: 30),
                    const Text(
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
                    const Text(
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
                            MaterialPageRoute(
                                builder: (context) => SignupPage()),
                          );
                        },
                        text: 'Sign Up')
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

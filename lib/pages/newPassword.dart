import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:trafficticket_management/components/button.dart';
import 'package:trafficticket_management/components/textField.dart';
import 'package:trafficticket_management/pages/login.dart';

class NewPassword extends StatelessWidget {
  NewPassword({super.key});
  final newPasswordController = TextEditingController();

  final confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 238, 239, 240),
      ),
      backgroundColor: const Color.fromARGB(255, 238, 239, 240),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30),
            const Center(
              child: Text(
                'New Password',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ),
            const SizedBox(
              height: 70,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 25.0),
                    child: Text(
                      'New Password',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 16),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  MyTextField(
                    controller: newPasswordController,
                    hintText: 'New Password',
                    obscureText: true,
                    enabled: true,
                    label: '',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 25.0),
                    child: Text(
                      'Confirm Password',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 16),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  MyTextField(
                    controller: confirmPasswordController,
                    hintText: 'Confirm Password',
                    obscureText: true,
                    enabled: true,
                    label: '',
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                ],
              ),
            ),
            Spacer(),
            Positioned(
              bottom: 20,
              child: MyButton(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  },
                  text: 'Save'),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
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
      backgroundColor: const Color.fromARGB(255, 238, 239, 240),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(left: 10.0),
              child: GestureDetector(
                child: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  },
                ),
              ),
            ),
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
              height: 50,
            ),
            Column(
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
                    obscureText: true, enabled: true,),
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
                    obscureText: true, enabled: true,),
                const SizedBox(
                  height: 50,
                ),
                MyButton(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                    },
                    text: 'Save'),
              ],
            )
          ],
        ),
      ),
    );
  }
}

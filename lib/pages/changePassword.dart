import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:trafficticket_management/components/button.dart';
import 'package:trafficticket_management/components/textField.dart';
import 'package:trafficticket_management/pages/login.dart';
import 'package:trafficticket_management/services/auth_services.dart';

class ChangePassword extends StatelessWidget {
  ChangePassword({super.key});
  final currentPassword = TextEditingController();
  final newPassword = TextEditingController();
  final confirmPassword = TextEditingController();

  final AuthService authService = AuthService();

  void changePassword(BuildContext context) {
    authService.changePassword(
        context: context,
        oldPassword: currentPassword.text,
        newPassword: newPassword.text,
        confirmPassword: confirmPassword.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 238, 239, 240),
      ),
      backgroundColor: const Color.fromARGB(255, 238, 239, 240),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 10),
            const Center(
              child: Text(
                'Change Password',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: SizedBox(
                    // width: 300,
                    // height: 100,
                    child: Text(
                      '''you"ll be  logged out of all sessions except this one to protect your account if anyone is strying to gain access.''',
                      textAlign:
                          TextAlign.justify, // Adjust the alignment as needed
                      softWrap: true,
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Column(
              children: [
                MyTextField(
                  controller: currentPassword,
                  hintText: 'Current password',
                  obscureText: true,
                  enabled: true,
                  label: '',
                ),
                const SizedBox(
                  height: 10,
                ),
                MyTextField(
                  controller: newPassword,
                  hintText: 'New password',
                  obscureText: true,
                  enabled: true,
                  label: '',
                ),
                const SizedBox(
                  height: 10,
                ),
                MyTextField(
                  controller: confirmPassword,
                  hintText: 'Re-type new password',
                  obscureText: true,
                  enabled: true,
                  label: '',
                ),
              ],
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: MyButton(
                  onTap: () => changePassword(context),
                  text: 'Change Password'),
            )
          ],
        ),
      ),
    );
  }
}

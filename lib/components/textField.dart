import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final controller;
  final String hintText;
  final bool obscureText;
  final bool enabled;
  final String label;

  const MyTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
    required this.enabled,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20.0),
      width: 800.0,
      height: 50.0,
      child: Center(
        child: TextField(
          style: const TextStyle(fontSize: 18),
          controller: controller,
          obscureText: obscureText,
          enabled: enabled,
          decoration: InputDecoration(
              labelText: label,
              labelStyle: const TextStyle(
                  color: Color.fromARGB(255, 2, 25, 66),
                  fontSize: 20,
                  fontWeight: FontWeight.w700),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
              ),
              fillColor: Colors.white,
              filled: true,
              hintText: hintText,
              floatingLabelBehavior: FloatingLabelBehavior.always,
              disabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                    color: Color.fromARGB(255, 255, 255,
                        255)), // Customize the border color for disabled state
              ),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
              hintStyle: TextStyle(color: Colors.grey[500])),
        ),
      ),
    );
  }
}

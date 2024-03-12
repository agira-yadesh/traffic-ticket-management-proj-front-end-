import 'dart:async';

import 'package:flutter/material.dart';
import 'package:trafficticket_management/pages/login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5), () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => LoginPage(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    print('SplashScreen is rebuilt.');
    return Scaffold(
      // backgroundColor: const Color.fromARGB(255, 4, 33, 196),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Color.fromARGB(255, 4, 20, 114),
            Color.fromARGB(255, 0, 38, 255),
          ], begin: Alignment.topLeft, end: Alignment.bottomRight),
        ),
        child: Center(
          child: Image.network('lib/images/whiteLogo.png'),
        ),
      ),
    );
  }
}

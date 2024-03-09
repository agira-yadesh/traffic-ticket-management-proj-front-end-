import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trafficticket_management/pages/homePage.dart';
import 'package:trafficticket_management/pages/login.dart';
import 'package:trafficticket_management/pages/setPassword.dart';
import 'package:trafficticket_management/pages/signup.dart';
import 'package:trafficticket_management/pages/splashScreen.dart';
import 'package:trafficticket_management/providers/user_provider.dart';
import 'package:trafficticket_management/services/auth_services.dart';
import 'package:device_preview/device_preview.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => UserProvider()),
  ], child: DevicePreview(enabled: true, builder: (context) => const MyApp())));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AuthService authService = AuthService();
  @override
  void initState() {
    super.initState();
    authService.getUserData(context);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Provider.of<UserProvider>(context).user.token.isEmpty
          ? const SplashScreen()
          : const HomePage(),
      // routes: {
      //   '/login': (context) => LoginPage(),
      //   '/signup': (context) => SignupPage(),
      //   '/password_setup': (context) => SetPasswordPage(),
      // },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trafficticket_management/pages/setPassword.dart';
import 'package:trafficticket_management/pages/signup.dart';
import 'package:trafficticket_management/providers/user_provider.dart';
import 'pages/login.dart';
import 'package:device_preview/device_preview.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => UserProvider()),
  ], child: DevicePreview(enabled: true, builder: (context) => const MyApp())));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginPage(),
        '/signup': (context) => SignupPage(),
        '/password_setup': (context) => SetPasswordPage(),
      },
    );
  }
}

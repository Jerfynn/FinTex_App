import 'package:flutter/material.dart';
import 'screens/loginscreen.dart'; // Import your login screen

void main() {
  runApp(FinTexApp());
}

class FinTexApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FinTex App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginScreen(), // Open the login screen
    );
  }
}

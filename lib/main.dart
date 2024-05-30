import 'package:flutter/material.dart';
import './pages/home.dart';
import './pages/loginPage.dart';
import './pages/personalData.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var materialApp = MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ApiPlaceHolderApp',
      home: const LoginPage(),
      routes: {
        '/home': (context) => const HomePage(),
        '/login': (context) => const LoginPage(),
        '/personalData' : (context) => const PresonalData(),
      },
    ); 
    return materialApp;
  }
}
import 'package:flutter/material.dart';
import 'pages/homePage.dart';
import './pages/loginPage.dart';
import 'pages/personalDataPage.dart';

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
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginPage(),
        '/home': (context) => const HomePage(),
        '/personalData' : (context) => PersonalDataPage(),
        '/login' : (context) => const LoginPage(),
      },
    ); 
    return materialApp;
  }
}
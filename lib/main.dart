import 'package:flutter/material.dart';
import 'pages/homePage.dart';
import './pages/loginPage.dart';
import 'pages/personalDataPage.dart';
import './pages/commentsPage.dart';
import 'pages/randomPhotoPage.dart';

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
        '/comments' : (context) => CommentsPage(),
        '/randomPhoto':(context) => RandomPhotosPage(),
        '/personalData' : (context) => PersonalDataPage(),
        '/login' : (context) => const LoginPage(),
      },
    ); 
    return materialApp;
  }
}
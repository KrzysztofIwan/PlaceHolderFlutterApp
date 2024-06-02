import 'package:api_placeholder_app/provider/userProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'pages/homePage.dart';
import 'pages/loginPage.dart';
import 'pages/personalDataPage.dart';
import 'pages/commentsPage.dart';
import 'pages/randomPhotoPage.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => UserProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ApiPlaceHolderApp',
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginPage(),
        '/home': (context) => const HomePage(),
        '/comments' : (context) => CommentsPage(),
        '/randomPhoto': (context) => RandomPhotosPage(),
        '/personalData' : (context) => const PersonalDataPage(),
        '/login' : (context) => const LoginPage(),
      },
    );
  }
}
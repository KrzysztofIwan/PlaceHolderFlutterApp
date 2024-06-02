import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/user.dart';
import '../provider/userProvider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  late dynamic logowanieNa;
  final List<User> users = List.empty(growable: true);

  Future<List<User>> getData() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    if (response.statusCode == 200) {
      List<dynamic> jsonList = jsonDecode(response.body);
      return jsonList.map((json) => User.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load users');
    }
  }

  void logowanie() {
    if (_formKey.currentState!.validate()) {
      User user = logowanieNa as User;
      // Ustawienie ID użytkownika w modelu UserModel
      final userModel = Provider.of<UserProvider>(context, listen: false);
      userModel.setUserId(user.id);
      Navigator.pushReplacementNamed(context, '/home');
    }
  }

  void refresh() {
    getData().then((value) => setState(() {
      users.addAll(value); // <- dodanie całej listy do listy
    }));
  }

  @override
  void initState() {
    super.initState();
    refresh();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(204, 255, 200, 1),
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('Strona Logowania'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                controller: _usernameController,
                decoration: const InputDecoration(
                  labelText: 'Login',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Proszę o podanie poprawnej nazwy';
                  }
                  if (users.where((x) => x.name == value).firstOrNull != null) {
                    logowanieNa = users.where((x) => x.name == value).first;
                    return null;
                  } else {
                    return 'Login lub hasło są złe';
                  }
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(
                  labelText: 'Hasło',
                ),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Proszę o podanie poprawnego hasła';
                  }

                  if (logowanieNa != null) {
                    var user = logowanieNa as User;
                    if (user.username == value) {
                      return null;
                    } else {
                      return 'Login lub hasło są złe';
                    }
                  } else {
                    return 'Nie podano wszystkich danych';
                  }
                },
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: logowanie,
                child: const Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

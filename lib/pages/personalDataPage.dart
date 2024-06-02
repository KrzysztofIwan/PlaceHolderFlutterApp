import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../bar/optionBar.dart' as appbar;
import '../bar/navigationBar.dart' as nvbar;
import '../provider/userProvider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/user.dart';

class PersonalDataPage extends StatefulWidget {
  const PersonalDataPage({super.key});
  
  @override
  State<PersonalDataPage> createState() => _PersonalDataPageState();
}

class _PersonalDataPageState extends State<PersonalDataPage> {
  late Future<User> user;

  Future<User> getData(int userId) async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users/$userId'));
    if (response.statusCode == 200) {
      dynamic json = jsonDecode(response.body);
      return User.fromJson(json);
    } else {
      throw Exception('Failed to load user');
    }
  }

  @override
  void initState() {
    super.initState();
    final userId = Provider.of<UserProvider>(context, listen: false).userId!;
    user = getData(userId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(204, 255, 200, 1),
      appBar: const appbar.OptionBar(),
      body: Center(child: 
        FutureBuilder<User>(
        future: user,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) 
          {
            return const Center(child: CircularProgressIndicator());
          } 
          else if (snapshot.hasError) 
          {
            return Center(child: Text('Error: ${snapshot.error}'));
          } 
          else if (snapshot.hasData) 
          {
            User user = snapshot.data!;
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: 
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Nazwa: ${user.name}',
                     style: const TextStyle(fontSize: 20)
                     ),
                  Text(
                    'Nazwa Użytkownika: ${user.username}',
                     style: const TextStyle(fontSize: 20)
                     ),
                  Text(
                    'Email: ${user.email}',
                     style: const TextStyle(fontSize: 20)
                     ),
                  Text(
                    'Telefon: ${user.phone}', 
                    style: const TextStyle(fontSize: 20)
                    ),
                  Text(
                    'Strona: ${user.website}',
                     style: const TextStyle(fontSize: 20)
                     ),
                  const SizedBox(height: 10),
                  const Text(
                    'Adres:', 
                    style: TextStyle(fontSize: 20, 
                                    fontWeight: FontWeight.bold,
                                    decorationColor: Colors.green)
                    ),
                  Text(
                    'Miasto: ${user.address.city}', 
                    style: const TextStyle(fontSize: 16)),
                  Text(
                    'Ulica: ${user.address.street}', 
                    style: const TextStyle(fontSize: 16)),
                  Text(
                    'Numer mieszkania: ${user.address.suite}', 
                    style: const TextStyle(fontSize: 16)),                  
                  Text(
                    'Kod pocztowy: ${user.address.zipcode}', 
                    style: const TextStyle(fontSize: 16)
                    ),
                  const SizedBox(height: 10),
                  const Text(
                    'Firma:', 
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)
                    ),
                  Text(
                    'Nazwa: ${user.company.name}', 
                    style: const TextStyle(fontSize: 16)
                    ),
                  Text(
                    'Frazy powiązane: ${user.company.catchPhrase}',
                     style: const TextStyle(fontSize: 16)
                     ),
                  Text(
                    'BS: ${user.company.bs}', 
                    style: const TextStyle(fontSize: 16)
                    ),
                ],
              ),
          );
          } 
          else 
          {
            return const Center(child: Text('Problem z połączeniem z API'));
          }
        },
      ),
      ),    
      bottomNavigationBar: const nvbar.NavigationBar(
        currentIndex: 3,
      ),
    );
  }
}

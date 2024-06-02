import 'dart:math';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../bar/optionBar.dart' as appbar;
import '../bar/navigationBar.dart' as nvbar;

class RandomPhotosPage extends StatefulWidget {
  const RandomPhotosPage({super.key});

  @override
  _RandomPhotosPageState createState() => _RandomPhotosPageState();
}

class _RandomPhotosPageState extends State<RandomPhotosPage> {
  late String imageUrl = '';

  Future<void> getData() async {
    final Random random = Random();
    final int randomId = random.nextInt(5000) + 1;
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/photos/$randomId'));
    if (response.statusCode == 200) {
      final Map<String, dynamic> json = jsonDecode(response.body);
      setState(() {
        imageUrl = json['url'];
      });
    } else {
      throw Exception('Failed to load random photo');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(204, 255, 200, 1),
      appBar: const appbar.OptionBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [          
            if (imageUrl.isNotEmpty)
              Image.network(imageUrl)
            else
              const  Text("Jeszcze nie pobrano zdjecia"),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                getData();
              },
              child: const Text('Pobierz losowy obraz'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const nvbar.NavigationBar(
        currentIndex: 2,
      ),
    );
  }
}

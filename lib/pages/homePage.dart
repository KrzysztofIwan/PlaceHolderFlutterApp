import 'package:flutter/material.dart';
import '../models/comment.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../bar/optionBar.dart' as appbar;
import '../bar/navigationBar.dart' as nvbar;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Comment? comment;

  Future<Comment> getData() async {
    Uri uri = Uri.parse('https://jsonplaceholder.typicode.com/comments?id=1');
    var response = await http.get(uri);
    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = json.decode(response.body);
      return Comment.fromJson(jsonResponse[0]);
    } else {
      throw Exception("Unable to connect to API");
    }
  }

  void refresh() {
    getData().then((value) => setState(() {
          comment = value;
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
      appBar: const appbar.OptionBar(),      
      body: comment == null
          ? const Center(child: CircularProgressIndicator())
          : ListView(
              padding: const EdgeInsets.all(16.0),
              children: [
                Text("Post ID: ${comment!.postId}"),
                const SizedBox(height: 8.0),
                Text("ID: ${comment!.id}"),
                const SizedBox(height: 8.0),
                Text("Name: ${comment!.name}"),
                const SizedBox(height: 8.0),
                Text("Email: ${comment!.email}"),
                const SizedBox(height: 8.0),
                Text("Body: ${comment!.body}"),
              ],
            ),
      bottomNavigationBar: nvbar.NavigationBar(
        currentIndex: 0,        
        //onItemTapped: (index) { },
      ),
    );
  }
}

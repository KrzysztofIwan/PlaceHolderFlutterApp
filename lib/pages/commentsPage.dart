import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../bar/optionBar.dart' as appbar;
import '../bar/navigationBar.dart' as nvbar;
import '../models/comment.dart';

class CommentsPage extends StatefulWidget {
  const CommentsPage({super.key});

  @override
  _CommentsPageState createState() => _CommentsPageState();
}

class _CommentsPageState extends State<CommentsPage> {
  late Future<List<Comment>> comments;
  String? selectedPostId;

  Future<List<Comment>> getData() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/comments'));
    if (response.statusCode == 200) {
      List<dynamic> jsonList = jsonDecode(response.body);
      return jsonList.map((json) => Comment.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load comments');
    }
  }

  @override
  void initState() {
    super.initState();
    comments = getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(204, 255, 200, 1),
      appBar: const appbar.OptionBar(),
      body: Column(
        children: [
          Padding(padding:  const EdgeInsets.all(8.0),
          child: 
          Container(
              color: Colors.green,
              child:
              Row(            
            children: [              
          const Text("   Wybierz Id postu:       ",
              style: TextStyle(fontSize: 15),),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DropdownButton<String>(
              hint: const Text("-"),
              value: selectedPostId,  
              onChanged: (String? newValue) {
                setState(() {
                  selectedPostId = newValue;
                });
              },
              items: List.generate(10, (index) => (index + 1).toString())
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
            ],
          ) 
              ),
              ),         
          Expanded(
            child: FutureBuilder<List<Comment>>(
              future: comments,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (snapshot.hasData) {
                  List<Comment> filteredComments = selectedPostId == null
                      ? snapshot.data!
                      : snapshot.data!.where((comment) => comment.postId.toString() == selectedPostId).toList();
                  return ListView.builder(
                    itemCount: filteredComments.length,
                    itemBuilder: (context, index) {
                      Comment comment = filteredComments[index];
                      return ListTile(
                        titleTextStyle: const TextStyle(
                          fontSize: 21,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontStyle: FontStyle.italic
                        ),
                        subtitleTextStyle: const TextStyle(
                          fontSize: 17,
                          color: Colors.black54
                        ),
                        title: Text("Tytuł: ${comment.name}"),
                        subtitle: Text("Opis: ${comment.body}"),
                      );
                    },
                  );
                } else {
                  return const Center(child: Text('Nie znaleziono komentarzy'));
                }
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: const nvbar.NavigationBar(
        currentIndex: 1,
      ),
    );
  }
}

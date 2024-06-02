import 'package:flutter/material.dart';
import '../bar/optionBar.dart' as appbar;
import '../bar/navigationBar.dart' as nvbar;

class CommentsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromRGBO(204, 255, 200, 1),
      appBar: appbar.OptionBar(),
      body:  Center(
        child: Text('CommentsPage'),
      ),
      bottomNavigationBar: nvbar.NavigationBar(
        currentIndex: 1, 
        //onItemTapped: (index) {  },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../bar/optionBar.dart' as appbar;
import '../bar/navigationBar.dart' as nvbar;

class RandomPhotosPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: appbar.OptionBar(),
      body:  Center(
        child: Text('RandomPhotosPage'),
      ),
      bottomNavigationBar: nvbar.NavigationBar(
        currentIndex: 2, 
        //onItemTapped: (index) {  },
      ),
    );
  }
}

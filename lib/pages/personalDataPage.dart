import 'package:flutter/material.dart';
import '../bar/optionBar.dart' as appbar;
import '../bar/navigationBar.dart' as nvbar;

class PersonalDataPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: appbar.OptionBar(),
      body:  Center(
        child: Text('Personal Data Page'),
      ),
      bottomNavigationBar: nvbar.NavigationBar(
        currentIndex: 1, 
        //onItemTapped: (index) {  },
      ),
    );
  }
}

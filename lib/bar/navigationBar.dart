import 'package:flutter/material.dart';

class NavigationBar extends StatelessWidget {
  final int currentIndex;
  //final Function(int) onItemTapped;

  const NavigationBar({
    Key? key,
    required this.currentIndex,
    //required this.onItemTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
  return BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.comment),
            label: 'Comments',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.photo_album),
            label: 'Random Photo',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Personal Data',
          ),
        ],
        currentIndex: currentIndex,
        selectedItemColor: Colors.green,
        unselectedItemColor : Colors.black,
        onTap: (int index) {
          if (index == 0 && currentIndex != 0) {
            Navigator.pushReplacementNamed(context, '/home');
          } else if (index == 1  && currentIndex != 1) {
            Navigator.pushReplacementNamed(context, '/comments');
          } else if (index == 2  && currentIndex != 2) {
            Navigator.pushReplacementNamed(context, '/randomPhoto');
          }else if (index == 3  && currentIndex != 3) {
            Navigator.pushReplacementNamed(context, '/personalData');
          }          
        }
      );
    }
}

import 'package:flutter/material.dart';

class MenuBar extends StatelessWidget implements PreferredSizeWidget {
  const MenuBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  void _logout(BuildContext context) {
    Navigator.pushReplacementNamed(context, '/login');
  }

  void _personalData(BuildContext context){
    Navigator.pushReplacementNamed(context, "/personalData");
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Strona główna'),
      actions: <Widget>[
        PopupMenuButton<String>(
          onSelected: (value) {
            if (value == 'logout') {
              _logout(context);
            }
            else if(value == 'personalData'){
              _personalData(context);
            }
          },
          itemBuilder: (BuildContext context) {
            return [
              const PopupMenuItem<String>(
                value: "personalData",
                child: Text("Twoje Dane"),
              ),
              const PopupMenuItem<String>(
                value: 'logout',
                child: Text('Wyloguj'),
              ),              
            ];
          },
        ),
      ],
    );
  }
}
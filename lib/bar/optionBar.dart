import 'package:flutter/material.dart';

class OptionBar extends StatelessWidget implements PreferredSizeWidget {
  const OptionBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  void _logout(BuildContext context) {
    Navigator.pushReplacementNamed(context, '/login');
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.green,
      title: const Text('ApiPlaceHolderAPP'),
      actions: <Widget>[
        PopupMenuButton<String>(
          color: const Color.fromARGB(255, 218, 255, 219),
          onSelected: (value) {
            if (value == 'logout') {
              _logout(context);
            }
          },
          itemBuilder: (BuildContext context) {
            return [
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
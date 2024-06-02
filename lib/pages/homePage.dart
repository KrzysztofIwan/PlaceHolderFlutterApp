import 'package:flutter/material.dart';
import '../bar/optionBar.dart' as appbar;
import '../bar/navigationBar.dart' as nvbar;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
    @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(204, 255, 200, 1),
      appBar: const appbar.OptionBar(),      
      body: Center(
        child: Container(
          width: 320,
          height: 200,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 218, 255, 219),
            borderRadius: BorderRadius.circular(40),
            boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.07),
                      offset: const Offset(0,10),
                      blurRadius: 40,
                      spreadRadius: 0
                    )
                  ],
          ),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
             Text(
              "Aplikacje przygotował:",
              style: TextStyle(fontSize: 30, fontStyle: FontStyle.italic),
             ),
             SizedBox(height: 20,),
             Text(
                "Krzysztof Iwański",
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
              Text(
                "13666",
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const nvbar.NavigationBar(
        currentIndex: 0,        
      ),
    );
  }
}

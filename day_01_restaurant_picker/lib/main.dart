import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<String> restaurant = [
    "MacDonald's",
    "Roscoe's Chicken & waffles",
    "Olive Garden",
    "Pizza Hut",
    "Panda Express",
    "Subway"
  ];

  int currentIndex;

  void updateIndex(){
    final random = Random();
    final index = random.nextInt(restaurant.length);
    setState(() {
      currentIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("What Do you Want to eat?"),
              if(currentIndex!=null)
                Text(
                  restaurant[currentIndex],
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              Padding(padding: EdgeInsets.only(top: 50)),
              FlatButton(
                  onPressed: (){
                      updateIndex();
                  },
                  child: Text("Pick Restaurant"),
                color: Colors.purple,
                textColor: Colors.white,
              )
            ],
          ),
        )
      ),
    );
  }
}

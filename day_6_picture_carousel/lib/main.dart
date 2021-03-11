import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _imagePaths = [
    'images/day01.png',
    'images/day02.png',
    'images/day03.png',
    'images/day04.png',
    'images/day05.png',
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Center(
            child: Builder(
              builder: (context){
                return Container(
                  padding: EdgeInsets.symmetric(horizontal: 4),
                  width: MediaQuery.of(context).size.width,
                  child: CarouselSlider(
                    options: CarouselOptions(
                        autoPlay: true
                    ),
                    items: _imagePaths.map((imagePath) {
                      return Image.asset(imagePath);
                    }).toList(),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

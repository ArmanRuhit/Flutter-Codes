import 'package:day_4_flashcard_app/flashcard.dart';
import 'package:day_4_flashcard_app/flashcard_view.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Flashcard> _flashcards = [
    Flashcard(
      question: "What is your name?",
      answer: "Ruhit Arman"
    ),
    Flashcard(
      question: "How old are you?",
      answer: "21",
    ),
    Flashcard(
      question: "Where do you live?",
      answer: "Chittagong"
    )
  ];
  int _currentIndex = 0;

  void showNextCard(){
      setState(() {
       _currentIndex = _currentIndex < _flashcards.length-1 ? _currentIndex + 1
        : 0;
      });
  }

  void showPrevCard(){
    setState(() {
      _currentIndex = _currentIndex > 0 ? _currentIndex - 1
          : _flashcards.length-1;
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
              SizedBox(
                width: 250,
                height: 250,
                child: FlipCard(
                  front: FlashcardView(text: _flashcards[_currentIndex].question),
                  back: FlashcardView(
                    text: _flashcards[_currentIndex].answer,
                  )
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  OutlineButton.icon(
                      onPressed: showPrevCard,
                      icon: Icon(Icons.chevron_left),
                      label: Text('Prev'),
                  ),
                  OutlineButton.icon(
                      onPressed: showNextCard,
                      icon: Icon(Icons.chevron_right),
                      label: Text('Next'),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

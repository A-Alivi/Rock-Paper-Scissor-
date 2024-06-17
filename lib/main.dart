import 'package:flutter/material.dart';
import 'package:rock_paper_scissor/game_main_screen.dart';
import 'package:rock_paper_scissor/splash_screen.dart';

void main() {
  runApp(
      //const GameApplication()
      MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Rock Paper Scissors',
        theme: ThemeData(
          primarySwatch: Colors.amber,
        ),
        home: SplashScreen());
  }
}

// // lib/splash_screen.dart

import 'package:flutter/material.dart';
import 'dart:async';

import 'package:rock_paper_scissor/game_main_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String loadingText = 'Loading';
  int dotCount = 0;
  Timer? dotTimer;

  @override
  void initState() {
    super.initState();

    // Timer for navigating to the next screen
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => GameApplication()));
    });

    // Timer for updating the loading text
    dotTimer = Timer.periodic(Duration(milliseconds: 500), (timer) {
      setState(() {
        dotCount = (dotCount + 1) % 4;
        loadingText = 'Loading' + '.' * dotCount;
      });
    });
  }

  @override
  void dispose() {
    dotTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.amber,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.sports_handball,
                size: 100.0,
                color: Colors.white,
              ),
              const SizedBox(height: 20.0),
              const Text(
                'Rock Paper Scissors',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20.0),
              Text(
                loadingText,
                style: const TextStyle(
                  fontSize: 18.0,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

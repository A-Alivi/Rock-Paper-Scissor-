import 'dart:math';
import 'package:flutter/material.dart';

class GameApplication extends StatefulWidget {
  const GameApplication({Key? key}) : super(key: key);

  @override
  State<GameApplication> createState() => _GameApplicationState();
}

class _GameApplicationState extends State<GameApplication> {
  int userChoice = 1;
  int opponentChoice = 1;

  String determineWinner(int userChoice, int opponentChoice) {
    if (userChoice == opponentChoice) {
      return 'It\'s a tie!';
    } else if ((userChoice == 1 && opponentChoice == 3) ||
        (userChoice == 2 && opponentChoice == 1) ||
        (userChoice == 3 && opponentChoice == 2)) {
      return 'You Win!';
    } else {
      return 'You Lose!';
    }
  }

  String detemineRsultTitle(int userChoice, opponentChoice) {
    if (determineWinner(userChoice, opponentChoice).contains('You Win!')) {
      return "Congratulations";
    } else if (determineWinner(userChoice, opponentChoice)
        .contains('You Lose!')) {
      return "Hard Luck!";
    }
    return "Try Again!";
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'vazir'),
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Rock   Paper   Scissors',
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
        backgroundColor: Colors.amber[100],
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'You:',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                Image.asset(
                  'images/$userChoice.png',
                  color: Colors.indigo,
                ),
                Builder(
                  builder: (BuildContext context) {
                    return TextButton(
                      onPressed: () {
                        setState(() {
                          userChoice = Random().nextInt(3) + 1;
                          opponentChoice = Random().nextInt(3) + 1;
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                backgroundColor: Colors.amber[100],
                                title: Text(detemineRsultTitle(
                                    userChoice, opponentChoice)),
                                content: Text(determineWinner(
                                    userChoice, opponentChoice)),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text('OK'),
                                  ),
                                ],
                              );
                            },
                          );
                        });
                      },
                      child: const Text(
                        'Start Game',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    );
                  },
                ),
                Image.asset(
                  'images/$opponentChoice.png',
                  color: Colors.indigo,
                ),
                const Text(
                  'Opponent:',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:sentence_unscramble/widgets/scrambled_word_box.dart';
import 'package:sentence_unscramble/widgets/solution_box.dart';
import 'dart:math';
import 'package:http/http.dart'  as http;

class GameScreen extends StatefulWidget {
  const GameScreen({ Key? key , required this.displayHint, required this.swapCount, required this.wordCount}) : super(key: key);

  // State variables to track
  final bool displayHint;
  final int swapCount;
  final int wordCount;

  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  // variables representing how many moves and how many correct moves have been made
  int moveCounter = 0;
  int winCond = 0;

  late List<String> solutionSentence = []; 
  late List<String> scrambledSentence = []; 

  @override
  void initState() {
    super.initState();
    setSentences(widget.wordCount);
  }

  // callback functions used to retrieve data from children widgets and update gamestate
  void incrementCounter() {
    setState(() {
      moveCounter++;
    });
  }

  // function that calls teammates microservice and sets a random sentence based on user choices
  void setSentences(wordCount) async {
    String url = 'http://10.0.2.2:3000/sentence/' + wordCount.toString();
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      List<String >finalSentence = response.body.toLowerCase().split(' ');
      setState(() {
        solutionSentence = finalSentence;
        scrambledSentence = scramble(solutionSentence, widget.swapCount);
      });
    } else {
      throw Exception('Unable to connect to server');
    }

  }

  // function to help determine if the user has won the game
  void incrementWinCond() {
    setState(() {
      winCond++;
      if(winCond == solutionSentence.length){
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text('Congrats! You won in $moveCounter moves. Please play again!'),
              actions: [
                TextButton(
                  onPressed: () {
                    // need to pop twice to exit pop screen and leave game
                    Navigator.pop(context);
                    Navigator.pop(context);
                    }, 
                  child: Text("Main Menu")
                  )
              ]
            );
          },
        );
      }
    });
  }

  // main build for gamescreen, composed of many widgets
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Sentence Unscrambler'))
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(15),
                child: SingleChildScrollView(
                  child: Wrap(
                    children: [
                      for (var word in solutionSentence) 
                        SolutionBox(word: word, displayHint: widget.displayHint, callbackFunctionIncrement: incrementCounter, callbackFunctionWinCond: incrementWinCond)
                    ]
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Text('$moveCounter moves', style: TextStyle(fontSize: 30),),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: SingleChildScrollView(
                  child: Wrap(
                    children: [
                      for (var word in scrambledSentence)
                        ScrambledWordBox(word: word)
                    ],
                  ),
                ),
              )
            ]
          )
        ),
      ),
    );
  }
}

// function used to scramble sentence coming from microservice
List<String> scramble(List<String> unscrambledSentence, int swaps) {
  final _random = Random();

  var returnSentence = List<String>.from(unscrambledSentence);

  for (int i = 0; i < swaps; i++) {
    int indexA = _random.nextInt(returnSentence.length);
    int indexB = _random.nextInt(returnSentence.length);
    String tempVar = returnSentence[indexA];
    returnSentence[indexA] = returnSentence[indexB];
    returnSentence[indexB] = tempVar;
  }

  return returnSentence;
}
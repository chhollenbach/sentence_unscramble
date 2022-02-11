import 'package:flutter/material.dart';
import 'package:sentence_unscramble/widgets/scrambled_word_box.dart';
import 'package:sentence_unscramble/widgets/solution_box.dart';
import 'dart:math';

class GameScreen extends StatefulWidget {
  const GameScreen({ Key? key , required this.displayHint, required this.swapCount}) : super(key: key);

  final bool displayHint;
  final int swapCount;

  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  int _moveCounter = 0;
  final List<String> solutionSentence = ['the', 'big', 'dog', 'ran', 'very', 'fast']; // This will be dynamic based on input from previous screen in final version
  late List<String> scrambledSentence = scramble(solutionSentence, widget.swapCount); 

  void _incrementCounter() {
    setState(() {
      _moveCounter++;
    });
  }


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
                child: Wrap(
                  children: [
                    for (var word in solutionSentence) 
                      SolutionBox(word: word, displayHint: widget.displayHint)
                  ]
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Text('$_moveCounter moves', style: TextStyle(fontSize: 30),),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Wrap(
                  children: [
                    for (var word in scrambledSentence)
                      ScrambledWordBox(word: word)
                  ],
                ),
              )
            ]
          )
        ),
      ),
    );
  }
}

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
import 'package:flutter/material.dart';

class SolutionBox extends StatefulWidget {
  const SolutionBox({ Key? key , required this.word, this.displayHint = true, required this.callbackFunctionIncrement, required this.callbackFunctionWinCond}) : super(key: key);

  final String word;
  final bool displayHint;
  final Function callbackFunctionIncrement;
  final Function callbackFunctionWinCond;

  @override
  _SolutionBoxState createState() => _SolutionBoxState();
}

// main build widget - represents that initially blacked out box at the top of the game screen where users
// drag words to during the game
class _SolutionBoxState extends State<SolutionBox> {
  bool correctMove = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: (
        DragTarget(
          builder: (context, candidateData, rejectedData) {
            return Column(
              children: [
                Container(
                  color: Colors.grey.shade400,
                  width: 70,
                  height: 45,
                  child: displayCorrectWord(correctMove, widget.word)
                ),
                if(widget.displayHint)
                SizedBox(
                  width: 70,
                  height: 22,
                  child: Center(child: Text(widget.word.length.toString())),
                )
              ],
            );
          },
          onAccept: (word) {
            widget.callbackFunctionIncrement();
            if (word==widget.word){
              setState(() {
                correctMove = true;
                widget.callbackFunctionWinCond();
              });
            }
          },
        )
      ),
    );
  }
}

// helper function to transform blacked out box to show the word after user
// guesses correctly
Widget displayCorrectWord(bool correctChoice, String word) {
  if (correctChoice) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: Text(word, style: TextStyle(fontSize: 30),)
    );
  } else {
    return Center(child: Text('', style: TextStyle(fontSize: 20)));
  }
}
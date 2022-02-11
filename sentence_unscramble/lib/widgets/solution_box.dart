import 'package:flutter/material.dart';

class SolutionBox extends StatefulWidget {
  const SolutionBox({ Key? key , required this.word, this.displayHint = true}) : super(key: key);

  final String word;
  final bool displayHint;

  @override
  _SolutionBoxState createState() => _SolutionBoxState();
}

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
            if (word==widget.word){
              setState(() {
                correctMove = true;
              });
            }
          },
        )
      ),
    );
  }
}

Widget displayCorrectWord(bool correctChoice, String word) {
  if (correctChoice) {
    return Center(child: Text(word, style: TextStyle(fontSize: 20)));
  } else {
    return Center(child: Text('', style: TextStyle(fontSize: 20)));
  }
}
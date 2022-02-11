import 'package:flutter/material.dart';
import 'package:sentence_unscramble/screens/game_screen.dart';
import '../screens/game_screen.dart';

class StartButton extends StatelessWidget {
  const StartButton({ Key? key, required this.displayHint, required this.swapCount}) : super(key: key);

  final bool displayHint;
  final int swapCount;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(30),
      child: ElevatedButton(
        onPressed: () {
          // navigates to game screen route
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => GameScreen(displayHint: displayHint, swapCount: swapCount,))
          );
        },
        child: Text('Start', style: TextStyle(fontSize: 50))
      ),
    );
  }
}
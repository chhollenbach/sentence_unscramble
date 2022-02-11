import 'package:flutter/material.dart';
import 'package:sentence_unscramble/screens/game_screen.dart';
import '../screens/game_screen.dart';

class StartButton extends StatelessWidget {
  const StartButton({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(30),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const GameScreen())
          );
        },
        child: Text('Start', style: TextStyle(fontSize: 50))
      ),
    );
  }
}
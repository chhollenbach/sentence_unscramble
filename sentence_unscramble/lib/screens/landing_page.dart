import 'package:flutter/material.dart';
import '../widgets/toggle_option.dart';
import '../widgets/text_option.dart';
import '../widgets/help_button.dart';
import '../widgets/start_button.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Sentence Unscrambler')),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Center(
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Game Options', style: TextStyle(fontSize: 30)),
            Row(
              children: [
                ToggleOption(helperText: 'Easy Mode - Letter Count Hints'),
                Spacer(),
                HelpButton(helperText: 'Toggle this option to display the letter count of the correct word for each blank space in the solution.')
              ]
            ),
            Row(
              children: [
                ToggleOption(helperText: 'Easy Mode - Undo Button'),
                Spacer(),
                HelpButton(helperText: 'Toggle this option to allow the ability to undo a move. Otherwise, all moves are final.')
              ]
            ),
            Row(
              children: [
                TextOption(helperText: 'Number of Words'),
                Spacer(),
                HelpButton(helperText: 'This sets the size of the sentence that will be scrambled. Maximum of N words.')
              ]
            ),
            Row(
              children: [
                TextOption(helperText: 'Number of Word Pairs Swapped'),
                Spacer(),
                HelpButton(helperText: 'This sets the number of swaps/scrambles that will occur in the sentence. More swaps means more randomization.')
              ]
            ),
            StartButton()
          ]
          )
        ) 
      )
    );
  }
}
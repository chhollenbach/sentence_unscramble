import 'package:flutter/material.dart';
import '../widgets/toggle_option.dart';
import '../widgets/text_option.dart';
import '../widgets/help_button.dart';

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
          children: [
            Text('Game Options', style: TextStyle(fontSize: 30)),
            Row(
              children: [
                ToggleOption(helperText: 'Easy Mode - Letter Count Hints'),
                HelpButton(helperText: 'Toggle this option to display the letter count of the correct word for each blank space in the solution.')
              ]
            ),
            Row(
              children: [
                ToggleOption(helperText: 'Easy Mode - Undo Button'),
                HelpButton(helperText: 'Toggle this option to allow the ability to undo a move. Otherwise, all moves are final.')
              ]
            ),
            Row(
              children: [
                TextOption(helperText: 'Number of Words'),
                HelpButton(helperText: 'This sets the size of the sentence that will be scrambled. Maximum of N words.')
              ]
            ),
            Row(
              children: [
                TextOption(helperText: 'Number of Word Pairs Swapped'),
                HelpButton(helperText: 'This sets the number of swaps/scrambles that will occur in the sentence. More swaps means more randomization.')
              ]
            )
          ]
          )
        ) 
      )
    );
  }
}
import 'package:flutter/material.dart';
import '../widgets/toggle_option.dart';
import '../widgets/text_option.dart';
import '../widgets/help_button.dart';
import '../widgets/start_button.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({ Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  // three state variables representing game options
  bool displayHint = false;
  int swapCount = 0;
  int wordCount = 6;

  // callback functions that are used to retrieve data from children widgets
  callbackDisplayHint(bool displayHintBool) {
    setState(() {
      displayHint = displayHintBool;
    });
  }

  callbackSwapCount(int swapCountInt) {
    setState(() {
      swapCount = swapCountInt;
    });
  }

  callbackSentenceWordCount(int wordCountInt) {
    setState(() {
      wordCount = wordCountInt;
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
            Text('Game Options', style: TextStyle(fontSize: 30)),
            Row(
              children: [
                ToggleOption(helperText: 'Easy Mode - Letter Count Hints', callbackFunction: callbackDisplayHint),
                Spacer(),
                HelpButton(
                  helperText: 'Toggle this option to display the letter count of the correct word for each blank space in the solution.',
                  tagNum: "a1"
                )
              ]
            ),
            Row(
              children: [
                TextOption(helperText: 'Number of Words', callbackFunction: callbackSentenceWordCount),
                Spacer(),
                HelpButton(
                  helperText: 'This sets the size of the sentence that will be scrambled. Maximum of N words.',
                  tagNum: "a2"
                )
              ]
            ),
            Row(
              children: [
                TextOption(helperText: 'Number of Word Pairs Swapped', callbackFunction: callbackSwapCount),
                Spacer(),
                HelpButton(
                  helperText: 'This sets the number of swaps/scrambles that will occur in the sentence. More swaps means more randomization.',
                  tagNum: "a3",
                )
              ]
            ),
            StartButton(displayHint: displayHint, swapCount: swapCount)
          ]
          )
        ) 
      )
    );
  }
}
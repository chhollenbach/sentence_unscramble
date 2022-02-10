import 'package:flutter/material.dart';

class HelpButton extends StatefulWidget {
  const HelpButton({ Key? key , required this.helperText}) : super(key: key);
  
  final String helperText;

  @override
  State<HelpButton> createState() => _HelpButtonState();
}

class _HelpButtonState extends State<HelpButton> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text(widget.helperText),
            );
          },
        );
      },
      child: Icon(Icons.info),
    );
  }
}
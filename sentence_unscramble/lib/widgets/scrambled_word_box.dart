import 'package:flutter/material.dart';

class ScrambledWordBox extends StatefulWidget {
  const ScrambledWordBox({ Key? key , required this.word}) : super(key: key);

  final String word;

  @override
  State<ScrambledWordBox> createState() => _ScrambledWordBoxState();
}

class _ScrambledWordBoxState extends State<ScrambledWordBox> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Draggable(
        child: Card(
          elevation: 15,
          child: SizedBox(
            width: 70,
            height: 45,
            child: Center(child: Text(widget.word, style: TextStyle(fontSize: 20),)),
          ),
        ),
        feedback: Card(
          elevation: 25,
          child: SizedBox(
            width: 70,
            height: 45,
            child: Center(child: Text(widget.word)),
          ),
        ),
        data: widget.word,
      ),
    );
  }
}
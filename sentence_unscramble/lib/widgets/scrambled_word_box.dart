import 'package:flutter/material.dart';

class ScrambledWordBox extends StatefulWidget {
  const ScrambledWordBox({ Key? key , required this.word}) : super(key: key);

  final String word;

  @override
  State<ScrambledWordBox> createState() => _ScrambledWordBoxState();
}

class _ScrambledWordBoxState extends State<ScrambledWordBox> {
  bool displaySelf = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Draggable(
        child: Card(
          elevation: 15,
          child: Column(
            children: [
              if (displaySelf)
              SizedBox(
                width: 70,
                height: 45,
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(widget.word, style: TextStyle(fontSize: 30),)
                )
              ),
              if (!displaySelf)
              Container(
                width: 70,
                height: 45,
                color: Colors.black,
              )
            ],
          ),
        ),
        feedback: Card(
          elevation: 25,
          child: SizedBox(
            width: 70,
            height: 45,
            child: FittedBox(
              fit: BoxFit.scaleDown,
                  child: Text(widget.word, style: TextStyle(fontSize: 30),)
            )
          ),
        ),
        data: widget.word,
      ),
    );
  }
}
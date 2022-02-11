import 'package:flutter/material.dart';

class TextOption extends StatefulWidget {
  const TextOption({ Key? key, required this.helperText}) : super(key: key);

  final String helperText;

  @override
  State<TextOption> createState() => _ToggleOptionState();
}

class _ToggleOptionState extends State<TextOption> {
  final _textController = TextEditingController(text: '6');

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 50,
                child: TextField(
                  controller: _textController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: '##'
                  )
                )
              ),
              Padding(padding: EdgeInsets.only(left: 8), child: Text(widget.helperText))
          ])
        ]
      ),
    );
  }
}
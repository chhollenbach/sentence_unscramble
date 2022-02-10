import 'package:flutter/material.dart';

class ToggleOption extends StatefulWidget {
  const ToggleOption({ Key? key, required this.helperText}) : super(key: key);

  final String helperText;

  @override
  State<ToggleOption> createState() => _ToggleOptionState();
}

class _ToggleOptionState extends State<ToggleOption> {
  bool _switchVal = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Switch(value: _switchVal, onChanged:(bool newValue) {
                setState(() {
                  _switchVal = newValue;
                });
              }),
              Text(widget.helperText)
          ])
        ]
      ),
    );
  }
}
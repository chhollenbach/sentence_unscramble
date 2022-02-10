import 'package:flutter/material.dart';

class StartButton extends StatelessWidget {
  const StartButton({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(30),
      child: TextButton(
        onPressed: () {},
        child: Text('Start', style: TextStyle(fontSize: 50),)
      ),
    );
  }
}
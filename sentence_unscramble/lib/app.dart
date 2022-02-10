import 'package:flutter/material.dart';
import 'screens/landing_page.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sentence Unscrambler',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
        scaffoldBackgroundColor: Colors.lightGreen.shade100 
        ),
      home: const LandingPage()
    );
  }
}

import 'package:flutter/material.dart';

void main() {
  runApp(const MatchstickApp());
}

class MatchstickApp extends StatelessWidget {
  const MatchstickApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Text(
            'Matchstick Equation Puzzle',
            style: TextStyle(fontSize: 24),
          ),
        ),
      ),
    );
  }
}
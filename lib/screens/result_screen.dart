import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final String result;

  ResultScreen({required this.result});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Result'),
      ),
      body: Center(
        child: Text(result, style: TextStyle(fontSize: 24)),
      ),
    );
  }
}

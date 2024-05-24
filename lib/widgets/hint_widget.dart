import 'package:flutter/material.dart';

class HintWidget extends StatelessWidget {
  final String hint;

  HintWidget({required this.hint});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blueAccent),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Text(hint, style: TextStyle(fontSize: 18)),
    );
  }
}

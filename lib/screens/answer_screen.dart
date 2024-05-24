import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../state/game_state.dart';
import 'category_list_screen.dart';

class AnswerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final gameState = Provider.of<GameState>(context);
    final puzzle = gameState.currentPuzzle;

    return Scaffold(
      appBar: AppBar(
        title: Text('Solution'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Center(
                child: Text(puzzle.answer,
                    style: TextStyle(fontSize: 18),
                    textAlign: TextAlign.center),
              ),
            ),
            ElevatedButton(
              child: Text('Back to Category Selection'),
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => CategoryListScreen()),
                  (route) => false,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

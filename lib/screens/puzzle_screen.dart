import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../state/game_state.dart';
import 'answer_screen.dart';

class PuzzleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final gameState = Provider.of<GameState>(context);
    final puzzle = gameState.currentPuzzle;

    return Scaffold(
      appBar: AppBar(
        title: Text('Puzzle ${gameState.currentPuzzleIndex + 1}'),
      ),
      body: Stack(
        children: [
          Center(
            child: Text(puzzle.question,
                style: TextStyle(fontSize: 18), textAlign: TextAlign.center),
          ),
          if (gameState.hintVisible)
            Center(
              child: Container(
                color: Colors.black54,
                padding: const EdgeInsets.all(8.0),
                child: Text(puzzle.hint,
                    style: TextStyle(fontSize: 16, color: Colors.white),
                    textAlign: TextAlign.center),
              ),
            ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                child: Text(gameState.hintVisible ? 'Hide Hint' : 'Show Hint'),
                onPressed: gameState.toggleHint,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                child: Text('Solution'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AnswerScreen()),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

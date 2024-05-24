import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../state/game_state.dart';

class PuzzleWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final gameState = Provider.of<GameState>(context);
    final puzzle = gameState.currentPuzzle;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(puzzle.question, style: TextStyle(fontSize: 18)),
        if (gameState.hintVisible) ...[
          SizedBox(height: 10),
          Text('Hint: ${puzzle.hint}', style: TextStyle(color: Colors.grey)),
        ],
      ],
    );
  }
}

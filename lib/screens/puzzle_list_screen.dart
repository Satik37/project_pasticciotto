import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../state/game_state.dart';
import 'puzzle_screen.dart';

class PuzzleListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final gameState = Provider.of<GameState>(context);
    final category = gameState.currentCategory;

    return Scaffold(
      appBar: AppBar(
        title: Text('Select a Puzzle'),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(8.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
        ),
        itemCount: category.puzzles.length,
        itemBuilder: (context, index) {
          final puzzle = category.puzzles[index];
          return GestureDetector(
            onTap: () {
              gameState.selectPuzzle(index);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PuzzleScreen()),
              );
            },
            child: GridTile(
              child: Image.asset(
                puzzle.image,
                fit: BoxFit.cover,
              ),
              footer: GridTileBar(
                backgroundColor: Colors.black54,
                title: Text('Puzzle ${index + 1}'),
              ),
            ),
          );
        },
      ),
    );
  }
}

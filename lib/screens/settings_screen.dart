import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../state/settings_state.dart';
import '../state/game_state.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final settingsState = Provider.of<SettingsState>(context);
    final gameState = Provider.of<GameState>(context);

    Map<String, int> languagePuzzles = {
      'English': gameState.getPuzzlesCountByLanguage('en'),
      'Spanish': gameState.getPuzzlesCountByLanguage('es'),
      'French': gameState.getPuzzlesCountByLanguage('fr'),
      'German': gameState.getPuzzlesCountByLanguage('de'),
      'Italian': gameState.getPuzzlesCountByLanguage('it'),
      'Russian': gameState.getPuzzlesCountByLanguage('ru'),
    };

    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
            childAspectRatio: 1.0,
          ),
          itemCount: languagePuzzles.length,
          itemBuilder: (context, index) {
            String language = languagePuzzles.keys.elementAt(index);
            int puzzleCount = languagePuzzles[language]!;
            return GestureDetector(
              onTap: () {
                settingsState.changeLanguage(language);
              },
              child: Card(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(language, style: TextStyle(fontSize: 18)),
                    SizedBox(height: 8),
                    Text('$puzzleCount puzzles',
                        style: TextStyle(fontSize: 14)),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

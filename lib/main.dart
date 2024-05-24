import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/home_screen.dart';
import 'state/game_state.dart';
import 'state/settings_state.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => GameState()),
        ChangeNotifierProvider(create: (_) => SettingsState()),
      ],
      child: Consumer<SettingsState>(
        builder: (context, settingsState, child) {
          return MaterialApp(
            title: 'Situation Puzzles Game',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            locale: settingsState.locale,
            home: HomeScreen(),
          );
        },
      ),
    );
  }
}

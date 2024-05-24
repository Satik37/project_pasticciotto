import 'package:flutter/material.dart';
import '../models/puzzle.dart';
import '../models/category.dart';
import '../services/puzzle_service.dart';

class GameState with ChangeNotifier {
  final PuzzleService _puzzleService = PuzzleService();
  List<Category> _categories = [];
  int _currentCategoryIndex = 0;
  int _currentPuzzleIndex = 0;
  bool _showHint = false;
  String _language = 'English';

  GameState() {
    _categories = _puzzleService.getCategories();
  }

  int get currentCategoryIndex => _currentCategoryIndex;
  int get currentPuzzleIndex => _currentPuzzleIndex;
  bool get hintVisible => _showHint;
  Category get currentCategory => _categories[_currentCategoryIndex];
  Puzzle get currentPuzzle =>
      _categories[_currentCategoryIndex].puzzles[_currentPuzzleIndex];
  List<Category> get categories => _categories;

  void toggleHint() {
    _showHint = !_showHint;
    notifyListeners();
  }

  void selectCategory(int index) {
    _currentCategoryIndex = index;
    _currentPuzzleIndex = 0;
    _showHint = false;
    notifyListeners();
  }

  void selectPuzzle(int index) {
    _currentPuzzleIndex = index;
    _showHint = false;
    notifyListeners();
  }

  void nextPuzzle() {
    _showHint = false;
    if (_currentPuzzleIndex <
        _categories[_currentCategoryIndex].puzzles.length - 1) {
      _currentPuzzleIndex++;
    } else {
      _currentPuzzleIndex = 0;
    }
    notifyListeners();
  }

  void changeLanguage(String language) {
    _language = language;
    // Filter or load puzzles based on the selected language
    _categories = _puzzleService.getCategoriesByLanguage(language);
    notifyListeners();
  }

  int getPuzzlesCountByLanguage(String languageCode) {
    // Implement a method in PuzzleService to count puzzles by language
    return _puzzleService.getPuzzlesCountByLanguage(languageCode);
  }
}

import '../models/puzzle.dart';
import '../models/category.dart';

class PuzzleService {
  List<Puzzle> getPuzzles() {
    return [
      Puzzle(
        question: "A man is found hanging in a room...",
        hint: "The room is completely empty...",
        answer: "The man climbed on a block of ice...",
        image: 'assets/images/puzzle_1.png',
        language: 'English',
      ),
      Puzzle(
        question: "A woman buys a new pair of shoes...",
        hint: "She walks with a limp...",
        answer: "She had wooden legs...",
        image: 'assets/images/puzzle_2.png',
        language: 'English',
      ),
      // Add more puzzles as needed
    ];
  }

  List<Category> getCategories() {
    return [
      Category(
        title: "Mystery",
        image: 'assets/images/category_mystery.png',
        puzzles:
            getPuzzles(), // Assuming all puzzles are under one category for simplicity
      ),
      Category(
        title: "Logic",
        image: 'assets/images/category_logic.png',
        puzzles:
            getPuzzles(), // You can create different sets of puzzles for each category
      ),
      // Add more categories as needed
    ];
  }

  List<Category> getCategoriesByLanguage(String language) {
    // Filter categories and puzzles based on language
    List<Puzzle> puzzles =
        getPuzzles().where((puzzle) => puzzle.language == language).toList();
    return [
      Category(
        title: "Mystery",
        image: 'assets/images/category_mystery.png',
        puzzles: puzzles,
      ),
      Category(
        title: "Logic",
        image: 'assets/images/category_logic.png',
        puzzles: puzzles,
      ),
    ];
  }

  int getPuzzlesCountByLanguage(String languageCode) {
    // Count puzzles by language
    return getPuzzles()
        .where((puzzle) => puzzle.language == languageCode)
        .length;
  }
}

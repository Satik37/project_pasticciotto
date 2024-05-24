import 'puzzle.dart';

class Category {
  final String title;
  final String image;
  final List<Puzzle> puzzles;

  Category({required this.title, required this.image, required this.puzzles});
}

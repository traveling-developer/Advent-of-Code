import 'package:adventofcode2023/day04.dart';
import 'package:test/test.dart';

void main() {
  group('day 4', () {
    final puzzleInput = '''Card 1: 41 48 83 86 17 | 83 86  6 31 17  9 48 53
Card 2: 13 32 20 16 61 | 61 30 68 82 17 32 24 19
Card 3:  1 21 53 59 44 | 69 82 63 72 16 21 14  1
Card 4: 41 92 73 84 69 | 59 84 76 51 58  5 54 83
Card 5: 87 83 26 28 32 | 88 30 70 12 93 22 82 36
Card 6: 31 18 13 56 72 | 74 77 10 23 35 67 36 11''';

    test('solveFirstPuzzle - example input - returns expected result', () {
      final day4 = Day4();

      final solution = day4.solveFirstPuzzle(puzzleInput);

      expect(solution, equals('13'));
    });

    test('solveSecondPuzzle - example input - returns expected result', () {
      final day4 = Day4();

      final solution = day4.solveSecondPuzzle(puzzleInput);

      expect(solution, equals('30'));
    });
  });
}

import 'package:adventofcode2024/day09.dart';
import 'package:test/test.dart';

void main() {
  group('day 9', () {
    final puzzleInput = '''2333133121414131402''';

    test('solveFirstPuzzle - example input - returns expected result', () {
      final day9 = Day9();

      final solution = day9.solveFirstPuzzle(puzzleInput);

      expect(solution, equals('1928'));
    });

    test('solveSecondPuzzle - example input - returns expected result', () {
      final day9 = Day9();

      final solution = day9.solveSecondPuzzle(puzzleInput);

      expect(solution, equals('2858'));
    });
  });
}

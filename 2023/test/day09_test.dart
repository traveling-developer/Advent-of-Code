import 'package:adventofcode2023/day09.dart';
import 'package:test/test.dart';

void main() {
  group('day 9', () {
    final puzzleInput = '''0 3 6 9 12 15
1 3 6 10 15 21
10 13 16 21 30 45''';

    test('solveFirstPuzzle - example input - returns expected result', () {
      final day9 = Day9();

      final solution = day9.solveFirstPuzzle(puzzleInput);

      expect(solution, equals('114'));
    });

    test('solveSecondPuzzle - example input - returns expected result', () {
      final day9 = Day9();

      final solution = day9.solveSecondPuzzle(puzzleInput);

      expect(solution, equals('2'));
    });
  });
}

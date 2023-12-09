import 'package:adventofcode2023/day06.dart';
import 'package:test/test.dart';

void main() {
  group('day 6', () {
    final puzzleInput = '''Time:      7  15   30
Distance:  9  40  200''';

    test('solveFirstPuzzle - example input - returns expected result', () {
      final day6 = Day6();

      final solution = day6.solveFirstPuzzle(puzzleInput);

      expect(solution, equals('288'));
    });

    test('solveSecondPuzzle - example input - returns expected result', () {
      final day6 = Day6();

      final solution = day6.solveSecondPuzzle(puzzleInput);

      expect(solution, equals('71503'));
    });
  });
}

import 'package:adventofcode2024/day01.dart';
import 'package:test/test.dart';

void main() {
  group('day 1', () {
    test('solveFirstPuzzle - example input - returns expected result', () {
      final day1 = Day1();
      final puzzleInput = '''3   4
4   3
2   5
1   3
3   9
3   3''';

      final solution = day1.solveFirstPuzzle(puzzleInput);

      expect(solution, equals('11'));
    });

    test('solveSecondPuzzle - example input - returns expected result', () {
      final day1 = Day1();
      final puzzleInput = '''3   4
4   3
2   5
1   3
3   9
3   3''';

      final solution = day1.solveSecondPuzzle(puzzleInput);

      expect(solution, equals('31'));
    });
  });
}

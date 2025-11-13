import 'package:adventofcode2024/day02.dart';
import 'package:test/test.dart';

void main() {
  group('day 2', () {
    final puzzleInput = '''7 6 4 2 1
1 2 7 8 9
9 7 6 2 1
1 3 2 4 5
8 6 4 4 1
1 3 6 7 9
''';

    test('solveFirstPuzzle - example input - returns expected result', () {
      final day2 = Day2();

      final solution = day2.solveFirstPuzzle(puzzleInput);

      expect(solution, equals('2'));
    });

    test('solveSecondPuzzle - example input - returns expected result', () {
      final day2 = Day2();

      final solution = day2.solveSecondPuzzle(puzzleInput);

      expect(solution, equals('4'));
    });
  });
}

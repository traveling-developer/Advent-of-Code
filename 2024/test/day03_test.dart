import 'package:adventofcode2024/day03.dart';
import 'package:test/test.dart';

void main() {
  group('day 3', () {
    final puzzleInput =
        '''xmul(2,4)%&mul[3,7]!@^do_not_mul(5,5)+mul(32,64]then(mul(11,8)mul(8,5))''';
    final puzzleInput2 =
        '''xmul(2,4)&mul[3,7]!^don't()_mul(5,5)+mul(32,64](mul(11,8)undo()?mul(8,5))''';

    test('solveFirstPuzzle - example input - returns expected result', () {
      final day3 = Day3();

      final solution = day3.solveFirstPuzzle(puzzleInput);

      expect(solution, equals('161'));
    });

    test('solveSecondPuzzle - example input - returns expected result', () {
      final day3 = Day3();

      final solution = day3.solveSecondPuzzle(puzzleInput2);

      expect(solution, equals('48'));
    });
  });
}

import 'package:adventofcode2023/day07.dart';
import 'package:test/test.dart';

void main() {
  group('day 7', () {
    final puzzleInput = '''32T3K 765
T55J5 684
KK677 28
KTJJT 220
QQQJA 483''';

    test('solveFirstPuzzle - example input - returns expected result', () {
      final day7 = Day7();

      final solution = day7.solveFirstPuzzle(puzzleInput);

      expect(solution, equals('6440'));
    });

    test('solveSecondPuzzle - example input - returns expected result', () {
      final day7 = Day7();

      final solution = day7.solveSecondPuzzle(puzzleInput);

      expect(solution, equals('5905'));
    });
  });
}

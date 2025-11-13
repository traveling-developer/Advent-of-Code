import 'package:adventofcode2024/day04.dart';
import 'package:test/test.dart';

void main() {
  group('day 4', () {
    final puzzleInput = '''MMMSXXMASM
MSAMXMSMSA
AMXSXMAAMM
MSAMASMSMX
XMASAMXAMM
XXAMMXXAMA
SMSMSASXSS
SAXAMASAAA
MAMMMXMMMM
MXMXAXMASX''';

    test('solveFirstPuzzle - example input - returns expected result', () {
      final day4 = Day4();

      final solution = day4.solveFirstPuzzle(puzzleInput);

      expect(solution, equals('18'));
    });

    test('solveSecondPuzzle - example input - returns expected result', () {
      final day4 = Day4();

      final solution = day4.solveSecondPuzzle(puzzleInput);

      expect(solution, equals('9'));
    });
  });
}

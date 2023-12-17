import 'package:adventofcode2023/day11.dart';
import 'package:test/test.dart';

void main() {
  group('day 11', () {
    final puzzleInput = '''...#......
.......#..
#.........
..........
......#...
.#........
.........#
..........
.......#..
#...#.....''';

    test('solveFirstPuzzle - example input - returns expected result', () {
      final day11 = Day11();

      final solution = day11.solveFirstPuzzle(puzzleInput);

      expect(solution, equals('374'));
    });

    test('solveSecondPuzzle - example input - returns expected result', () {
      final day11 = Day11();
      day11.factor = 10;

      final solution = day11.solveSecondPuzzle(puzzleInput);

      expect(solution, equals('1030'));
    });
  });
}

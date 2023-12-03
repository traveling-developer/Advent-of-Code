import 'package:adventofcode2023/day03.dart';
import 'package:test/test.dart';

void main() {
  group('day 3', () {
    final puzzleInput = '''467..114..
...*......
..35..633.
......#...
617*......
.....+.58.
..592.....
......755.
...\$.*....
.664.598..
''';

    test('solveFirstPuzzle - example input - returns expected result', () {
      final day3 = Day3();

      final solution = day3.solveFirstPuzzle(puzzleInput);

      expect(solution, equals('4361'));
    });

    test('solveFirstPuzzle - special input - returns expected result', () {
      final day3 = Day3();
      final specialPuzzleInput = '''65.65#..
#.......''';

      final solution = day3.solveFirstPuzzle(specialPuzzleInput);

      expect(solution, equals('130'));
    });

    test('solveSecondPuzzle - example input - returns expected result', () {
      final day3 = Day3();

      final solution = day3.solveSecondPuzzle(puzzleInput);

      expect(solution, equals('467835'));
    });
  });
}

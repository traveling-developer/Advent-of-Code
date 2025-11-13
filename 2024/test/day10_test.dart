import 'package:adventofcode2024/day10.dart';
import 'package:test/test.dart';

void main() {
  group('day 10', () {
    final puzzleInput = '''89010123
78121874
87430965
96549874
45678903
32019012
01329801
10456732''';

    test('solveFirstPuzzle - example input - returns expected result', () {
      final day10 = Day10();

      final solution = day10.solveFirstPuzzle(puzzleInput);

      expect(solution, equals('36'));
    });

    test('solveSecondPuzzle - example input - returns expected result', () {
      final day10 = Day10();

      final solution = day10.solveSecondPuzzle(puzzleInput);

      expect(solution, equals('SOMEVALUE'));
    });
  });
}

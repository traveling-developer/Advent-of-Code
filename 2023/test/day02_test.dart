import 'package:adventofcode2023/day02.dart';
import 'package:test/test.dart';

void main() {
  group('day 2', () {
    final puzzleInput = '''Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green
Game 2: 1 blue, 2 green; 3 green, 4 blue, 1 red; 1 green, 1 blue
Game 3: 8 green, 6 blue, 20 red; 5 blue, 4 red, 13 green; 5 green, 1 red
Game 4: 1 green, 3 red, 6 blue; 3 green, 6 red; 3 green, 15 blue, 14 red
Game 5: 6 red, 1 blue, 3 green; 2 blue, 1 red, 2 green
''';

    test('solveFirstPuzzle - example input - returns expected result', () {
      final day2 = Day2();

      final solution = day2.solveFirstPuzzle(puzzleInput);

      expect(solution, equals('8'));
    });

    test('solveSecondPuzzle - example input - returns expected result', () {
      final day2 = Day2();

      final solution = day2.solveSecondPuzzle(puzzleInput);

      expect(solution, equals('2286'));
    });
  });
}

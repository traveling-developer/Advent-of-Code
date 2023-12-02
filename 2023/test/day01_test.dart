import 'package:adventofcode2023/day01.dart';
import 'package:test/test.dart';

void main() {
  group('day 1', () {
    test('solveFirstPuzzle - example input - returns expected result', () {
      final day1 = Day1();
      final puzzleInput = '''1abc2
pqr3stu8vwx
a1b2c3d4e5f
treb7uchet''';

      final solution = day1.solveFirstPuzzle(puzzleInput);

      expect(solution, equals('142'));
    });

    test('solveSecondPuzzle - example input - returns expected result', () {
      final day1 = Day1();
      final puzzleInput = '''two1nine
eightwothree
abcone2threexyz
xtwone3four
4nineeightseven2
zoneight234
7pqrstsixteen''';

      final solution = day1.solveSecondPuzzle(puzzleInput);

      expect(solution, equals('281'));
    });

    test('solveSecondPuzzle - special input - returns expected result', () {
      final day1 = Day1();
      final puzzleInput = 'two7nine888fourthreenine';

      final solution = day1.solveSecondPuzzle(puzzleInput);

      expect(solution, equals('29'));
    });
  });
}

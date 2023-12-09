import 'package:adventofcode2023/day08.dart';
import 'package:test/test.dart';

void main() {
  group('day 8', () {
    test('solveFirstPuzzle - first example input - returns expected result', () {
      final day8 = Day8();
      final puzzleInput = '''RL

AAA = (BBB, CCC)
BBB = (DDD, EEE)
CCC = (ZZZ, GGG)
DDD = (DDD, DDD)
EEE = (EEE, EEE)
GGG = (GGG, GGG)
ZZZ = (ZZZ, ZZZ)''';
      final solution = day8.solveFirstPuzzle(puzzleInput);

      expect(solution, equals('2'));
    });

    test('solveFirstPuzzle - second example input - returns expected result', () {
      final day8 = Day8();
      final puzzleInput = '''LLR

AAA = (BBB, BBB)
BBB = (AAA, ZZZ)
ZZZ = (ZZZ, ZZZ)''';
      final solution = day8.solveFirstPuzzle(puzzleInput);

      expect(solution, equals('6'));
    });

    test('solveSecondPuzzle - example input - returns expected result', () {
      final day8 = Day8();
      final puzzleInput = '''LR

11A = (11B, XXX)
11B = (XXX, 11Z)
11Z = (11B, XXX)
22A = (22B, XXX)
22B = (22C, 22C)
22C = (22Z, 22Z)
22Z = (22B, 22B)
XXX = (XXX, XXX)''';
      final solution = day8.solveSecondPuzzle(puzzleInput);

      expect(solution, equals('6'));
    });
  });
}

import 'package:adventofcode2023/day15.dart';
import 'package:test/test.dart';

void main() {
  group('day 15', () {
    final puzzleInput = '''rn=1,cm-,qp=3,cm=2,qp-,pc=4,ot=9,ab=5,pc-,pc=6,ot=7''';

    test('hash - example input - returns expected result', () {
      final day15 = Day15();

      final solution = day15.hash('HASH');

      expect(solution, equals(52));
    });

    test('solveFirstPuzzle - example input - returns expected result', () {
      final day15 = Day15();

      final solution = day15.solveFirstPuzzle(puzzleInput);

      expect(solution, equals('1320'));
    });

    test('solveSecondPuzzle - example input - returns expected result', () {
      final day15 = Day15();

      final solution = day15.solveSecondPuzzle(puzzleInput);

      expect(solution, equals('145'));
    });
  });
}

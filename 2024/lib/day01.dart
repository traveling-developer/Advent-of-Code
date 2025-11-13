import 'package:adventofcode2024/day.dart';
import 'package:adventofcode2024/helper/string_extensions.dart';

class Day1 implements Day {
  @override
  int get dayNumber => 1;

  @override
  String solveFirstPuzzle(String puzzleInput) {
    List<int> leftNumbers = [];
    List<int> rightNumbers = [];
    puzzleInput.splitPerLine().forEach((rawLine) {
      var test = rawLine.split('   ').map((e) {
        return int.parse(e);
      });
      leftNumbers.add(test.first);
      rightNumbers.add(test.last);
    });

    leftNumbers.sort();
    rightNumbers.sort();

    int sum = 0;
    for (var i = 0; i < leftNumbers.length; i++) {
      sum += (rightNumbers[i] - leftNumbers[i]).abs();
    }

    return sum.toString();
  }

  @override
  String solveSecondPuzzle(String puzzleInput) {
    List<int> leftNumbers = [];
    List<int> rightNumbers = [];
    puzzleInput.splitPerLine().forEach((rawLine) {
      var test = rawLine.split('   ').map((e) {
        return int.parse(e);
      });
      leftNumbers.add(test.first);
      rightNumbers.add(test.last);
    });

    int sum = 0;

    for (var number in leftNumbers) {
      var l = rightNumbers.where((x) => x == number).length;
      sum += number * l;
    }

    return sum.toString();
  }
}

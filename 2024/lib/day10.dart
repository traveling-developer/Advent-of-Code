import 'package:adventofcode2024/day.dart';
import 'package:adventofcode2024/helper/string_extensions.dart';
import 'package:adventofcode2024/helper/table.dart';

class Day10 implements Day {
  @override
  int get dayNumber => 10;

  @override
  String solveFirstPuzzle(String puzzleInput) {
    var rows = puzzleInput.splitPerLine().map((e) => e.split('').map(int.parse));
    var table = Table(rows);
    var startingPoints = table.asIterableCells().where((x) => x.value == 0);

    for (var element in startingPoints) {
      var top = table.getValuee(element.y + 1, element.x);
      if (top != null && element.value + 1 == top) {}
      var bottom = table.getValuee(element.y - 1, element.x);
      if (bottom != null && element.value + 1 == bottom) {}
      var left = table.getValuee(element.y, element.x - 1);
      if (left != null && element.value + 1 == left) {}
      var right = table.getValuee(element.y, element.x + 1);
      if (right != null && element.value + 1 == right) {}
    }

    return '';
  }

  @override
  String solveSecondPuzzle(String puzzleInput) {
    return '';
  }
}

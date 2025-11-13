import 'package:adventofcode2024/day.dart';
import 'package:adventofcode2024/helper/cell.dart';
import 'package:adventofcode2024/helper/string_extensions.dart';
import 'package:adventofcode2024/helper/table.dart';

class Day4 implements Day {
  @override
  int get dayNumber => 4;

  @override
  String solveFirstPuzzle(String puzzleInput) {
    var rows = puzzleInput.splitPerLine().map((e) => e.split(''));
    var table = Table(rows);
    var x = table.asIterableCells().where((x) => x.value == 'X').toList();
    var count = 0;
    count += leftToRight(table, x);
    count += rightToLeft(table, x);
    count += dia1(table, x);
    count += dia2(table, x);
    count += dia3(table, x);
    count += dia4(table, x);
    count += toBottom(table, x);
    count += toTop(table, x);
    return count.toString();
  }

  @override
  String solveSecondPuzzle(String puzzleInput) {
    var rows = puzzleInput.splitPerLine().map((e) => e.split(''));
    var table = Table(rows);
    var x = table.asIterableCells().where((x) => x.value == 'A').toList();
    var count = 0;
    count += normal(table, x);
    return count.toString();
  }

  int leftToRight(Table<String> table, List<Cell<String>> x) {
    var count = 0;
    for (var element in x) {
      try {
        var m = table.getValue(element.y, element.x + 1);
        var a = table.getValue(element.y, element.x + 2);
        var s = table.getValue(element.y, element.x + 3);
        if (element.value + m + a + s == 'XMAS') {
          count++;
          continue;
        }
      } catch (e) {
        continue;
      }
    }
    return count;
  }

  int rightToLeft(Table<String> table, List<Cell<String>> x) {
    var count = 0;
    for (var element in x) {
      try {
        var m = table.getValue(element.y, element.x - 1);
        var a = table.getValue(element.y, element.x - 2);
        var s = table.getValue(element.y, element.x - 3);
        if (element.value + m + a + s == 'XMAS') {
          count++;
          continue;
        }
      } catch (e) {
        continue;
      }
    }
    return count;
  }

  int dia1(Table<String> table, List<Cell<String>> x) {
    var count = 0;
    for (var element in x) {
      try {
        var m = table.getValue(element.y + 1, element.x + 1);
        var a = table.getValue(element.y + 2, element.x + 2);
        var s = table.getValue(element.y + 3, element.x + 3);
        if (element.value + m + a + s == 'XMAS') {
          count++;
          continue;
        }
      } catch (e) {
        continue;
      }
    }
    return count;
  }

  int dia2(Table<String> table, List<Cell<String>> x) {
    var count = 0;
    for (var element in x) {
      try {
        var m = table.getValue(element.y - 1, element.x - 1);
        var a = table.getValue(element.y - 2, element.x - 2);
        var s = table.getValue(element.y - 3, element.x - 3);
        if (element.value + m + a + s == 'XMAS') {
          count++;
          continue;
        }
      } catch (e) {
        continue;
      }
    }
    return count;
  }

  int toBottom(Table<String> table, List<Cell<String>> x) {
    var count = 0;
    for (var element in x) {
      try {
        var m = table.getValue(element.y - 1, element.x);
        var a = table.getValue(element.y - 2, element.x);
        var s = table.getValue(element.y - 3, element.x);
        if (element.value + m + a + s == 'XMAS') {
          count++;
          continue;
        }
      } catch (e) {
        continue;
      }
    }
    return count;
  }

  int toTop(Table<String> table, List<Cell<String>> x) {
    var count = 0;
    for (var element in x) {
      try {
        var m = table.getValue(element.y + 1, element.x);
        var a = table.getValue(element.y + 2, element.x);
        var s = table.getValue(element.y + 3, element.x);
        if (element.value + m + a + s == 'XMAS') {
          count++;
          continue;
        }
      } catch (e) {
        continue;
      }
    }
    return count;
  }

  int dia3(Table<String> table, List<Cell<String>> x) {
    var count = 0;
    for (var element in x) {
      try {
        var m = table.getValue(element.y + 1, element.x - 1);
        var a = table.getValue(element.y + 2, element.x - 2);
        var s = table.getValue(element.y + 3, element.x - 3);
        if (element.value + m + a + s == 'XMAS') {
          count++;
          continue;
        }
      } catch (e) {
        continue;
      }
    }
    return count;
  }

  int dia4(Table<String> table, List<Cell<String>> x) {
    var count = 0;
    for (var element in x) {
      try {
        var m = table.getValue(element.y - 1, element.x + 1);
        var a = table.getValue(element.y - 2, element.x + 2);
        var s = table.getValue(element.y - 3, element.x + 3);
        if (element.value + m + a + s == 'XMAS') {
          count++;
          continue;
        }
      } catch (e) {
        continue;
      }
    }
    return count;
  }

  int normal(Table<String> table, List<Cell<String>> x) {
    var count = 0;
    for (var element in x) {
      try {
        var m = table.getValue(element.y - 1, element.x + 1);
        var a = table.getValue(element.y - 2, element.x + 2);
        var s = table.getValue(element.y - 3, element.x + 3);
        if (element.value + m + a + s == 'XMAS') {
          count++;
          continue;
        }
      } catch (e) {
        continue;
      }
    }
    return count;
  }
}

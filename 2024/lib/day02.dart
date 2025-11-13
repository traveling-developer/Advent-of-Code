import 'package:adventofcode2024/day.dart';
import 'package:adventofcode2024/helper/string_extensions.dart';
import 'package:collection/collection.dart';
import 'package:quiver/iterables.dart';

class Day2 implements Day {
  @override
  int get dayNumber => 2;

  @override
  String solveFirstPuzzle(String puzzleInput) {
    var test = puzzleInput.splitPerLine().map((e) => e.split(' ').map(int.parse));
    var safe = 0;
    for (var element in test) {
      var asc = element.isSorted((a, b) => a.compareTo(b));
      var desc = element.isSorted((a, b) => b.compareTo(a));

      if (asc || desc) {
        var test = zip([element, element.skip(1)]).every(
            (pair) => (pair.first - pair.last).abs() >= 1 && (pair.first - pair.last).abs() <= 3);
        if (test) {
          safe++;
        }
      }
    }
    return safe.toString();
  }

  @override
  String solveSecondPuzzle(String puzzleInput) {
    var test = puzzleInput.splitPerLine().map((e) => e.split(' ').map(int.parse));
    var safe = 0;
    for (var element in test) {
      var asc = element.isSorted((a, b) => a.compareTo(b));
      var desc = element.isSorted((a, b) => b.compareTo(a));

      if (asc || desc) {
        var test = zip([element, element.skip(1)]).every(
            (pair) => (pair.first - pair.last).abs() >= 1 && (pair.first - pair.last).abs() <= 3);
        if (test) {
          safe++;
        } else {
          for (var i = 0; i < element.length; i++) {
            var newList = element.toList();
            newList.removeAt(i);
            var newTest = zip([newList, newList.skip(1)]).every((pair) =>
                (pair.first - pair.last).abs() >= 1 && (pair.first - pair.last).abs() <= 3);
            if (newTest) {
              safe++;
              break;
            }
          }
        }
      } else {
        for (var i = 0; i < element.length; i++) {
          var newList = element.toList();
          newList.removeAt(i);
          var newTest = zip([newList, newList.skip(1)]).every(
              (pair) => (pair.first - pair.last).abs() >= 1 && (pair.first - pair.last).abs() <= 3);
          if (newTest) {
            var asc = newList.isSorted((a, b) => a.compareTo(b));
            var desc = newList.isSorted((a, b) => b.compareTo(a));
            if (asc || desc) {
              safe++;
              break;
            }
          }
        }
      }
    }
    return safe.toString();
  }
}

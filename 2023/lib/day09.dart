import 'package:adventofcode2023/day.dart';
import 'package:adventofcode2023/helper/string_extensions.dart';
import 'package:collection/collection.dart';

class Day9 implements Day {
  @override
  int get dayNumber => 9;

  @override
  String solveFirstPuzzle(String puzzleInput) {
    var histories =
        puzzleInput.splitPerLine().map((e) => e.split(' ').map((e) => int.parse(e))).toList();

    var extrapolatedValues = <int>[];
    for (var history in histories) {
      var allSequences = _getAllSequences(history);

      var reversedSequences = allSequences.reversed;
      var extrapolatedValue = 0;

      for (var i = 0; i < reversedSequences.length - 1; i++) {
        var nextSequence = reversedSequences.elementAt(i + 1);

        extrapolatedValue = extrapolatedValue + nextSequence.last;
      }

      extrapolatedValues.add(extrapolatedValue);
    }

    var result = extrapolatedValues.sum;

    return result.toString();
  }

  @override
  String solveSecondPuzzle(String puzzleInput) {
    var histories =
        puzzleInput.splitPerLine().map((e) => e.split(' ').map((e) => int.parse(e))).toList();

    var extrapolatedValues = <int>[];
    for (var history in histories) {
      var allSequences = _getAllSequences(history);

      var reversedSequences = allSequences.reversed;
      var extrapolatedValue = 0;

      for (var i = 0; i < reversedSequences.length - 1; i++) {
        var nextSequence = reversedSequences.elementAt(i + 1);

        extrapolatedValue = nextSequence.first - extrapolatedValue;
      }

      extrapolatedValues.add(extrapolatedValue);
    }

    var result = extrapolatedValues.sum;

    return result.toString();
  }

  List<Iterable<int>> _getAllSequences(Iterable<int> historySequence) {
    List<Iterable<int>> allSequences = [];
    allSequences.add(historySequence);

    while (!allSequences.any((element) => element.every((x) => x == 0))) {
      var differenceSequence = _getDifferences(allSequences.last);
      allSequences.add(differenceSequence);
    }

    return allSequences;
  }

  List<int> _getDifferences(Iterable<int> sequence) {
    var differences = <int>[];

    for (var i = 0; i < sequence.length - 1; i++) {
      var difference = sequence.elementAt(i + 1) - sequence.elementAt(i);
      differences.add(difference);
    }

    return differences;
  }
}

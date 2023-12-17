import 'package:adventofcode2023/day.dart';
import 'package:adventofcode2023/helper/string_extensions.dart';
import 'package:collection/collection.dart';
import 'package:trotter/trotter.dart';

class Day11 implements Day {
  @override
  int get dayNumber => 11;

  @override
  String solveFirstPuzzle(String puzzleInput) {
    var rows = puzzleInput.splitPerLine().map((e) => e.split(''));
    var universe = Universe(rows);

    var galaxies = universe.galaxiesPositions();

    var galaxyCombinations = Combinations(2, galaxies).iterable.toList();

    var allDistances = <int>[];

    for (var combination in galaxyCombinations) {
      List<({int x, int y})> element = combination as List<({int x, int y})>;

      var xDistance = (element.first.x - element.last.x).abs();
      var yDistance = (element.first.y - element.last.y).abs();

      var distance = xDistance + yDistance;

      var emptyColumnsBetween = universe.emptyColumnsBetween(element.first, element.last);
      var emptyRowsBetween = universe.emptyRowsBetween(element.first, element.last);

      distance = distance + emptyColumnsBetween + emptyRowsBetween;

      allDistances.add(distance);
    }

    var result = allDistances.sum;

    return result.toString();
  }

  int factor = 1000000;

  @override
  String solveSecondPuzzle(String puzzleInput) {
    var rows = puzzleInput.splitPerLine().map((e) => e.split(''));
    var universe = Universe(rows);

    var galaxies = universe.galaxiesPositions();

    var galaxyCombinations = Combinations(2, galaxies).iterable.toList();

    var allDistances = <int>[];

    for (var combination in galaxyCombinations) {
      List<({int x, int y})> element = combination as List<({int x, int y})>;

      var xDistance = (element.first.x - element.last.x).abs();
      var yDistance = (element.first.y - element.last.y).abs();

      var distance = xDistance + yDistance;

      var emptyColumnsBetween = universe.emptyColumnsBetween(element.first, element.last);
      var emptyRowsBetween = universe.emptyRowsBetween(element.first, element.last);

      distance =
          distance + (emptyColumnsBetween * (factor - 1)) + (emptyRowsBetween * (factor - 1));

      allDistances.add(distance);
    }

    var result = allDistances.sum;

    return result.toString();
  }
}

class Universe {
  final Map<({int x, int y}), String> _pointValueMap = {};

  late final Iterable<Iterable<String>> _rawUniverse;
  final List<int> emptyRowIndices = [];
  final List<int> emptyColumnIndices = [];

  Universe(Iterable<Iterable<String>> rawUniverse) {
    _rawUniverse = rawUniverse;

    _initializeMap(rawUniverse);
    _initializeEmptyColumnIndices();
    _initializeEmptyRowIndices();
  }

  List<({int x, int y})> galaxiesPositions() {
    return _pointValueMap.entries
        .where((element) => element.value == '#')
        .map((e) => e.key)
        .toList();
  }

  int emptyColumnsBetween(({int x, int y}) left, ({int x, int y}) right) {
    var columnsBetween = 0;

    for (var element in emptyColumnIndices) {
      if (left.x < element && right.x > element) {
        columnsBetween++;
      } else if (right.x < element && left.x > element) {
        columnsBetween++;
      }
    }
    return columnsBetween;
  }

  int emptyRowsBetween(({int x, int y}) left, ({int x, int y}) right) {
    var rowsBetween = 0;

    for (var element in emptyRowIndices) {
      if (left.y < element && right.y > element) {
        rowsBetween++;
      } else if (right.y < element && left.y > element) {
        rowsBetween++;
      }
    }

    return rowsBetween;
  }

  void _initializeMap(Iterable<Iterable<String>> rawUniverse) {
    for (var i = 0; i < rawUniverse.length; i++) {
      for (var j = 0; j < rawUniverse.first.length; j++) {
        _pointValueMap.putIfAbsent((x: j, y: i), () => rawUniverse.elementAt(i).elementAt(j));
      }
    }
  }

  void _initializeEmptyColumnIndices() {
    for (var i = 0; i < _rawUniverse.first.length; i++) {
      var column =
          _pointValueMap.keys.where((element) => element.x == i).map((e) => _pointValueMap[e]!);

      if (column.every((element) => element == '.')) {
        emptyColumnIndices.add(i);
      }
    }
  }

  void _initializeEmptyRowIndices() {
    for (var i = 0; i < _rawUniverse.length; i++) {
      var column =
          _pointValueMap.keys.where((element) => element.y == i).map((e) => _pointValueMap[e]!);

      if (column.every((element) => element == '.')) {
        emptyRowIndices.add(i);
      }
    }
  }
}

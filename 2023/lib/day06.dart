import 'package:adventofcode2023/day.dart';
import 'package:adventofcode2023/helper/string_extensions.dart';
import 'package:collection/collection.dart';

class Day6 implements Day {
  @override
  int get dayNumber => 6;

  @override
  String solveFirstPuzzle(String puzzleInput) {
    var timesAndDistances = puzzleInput.splitPerLine().map((e) => e.split(' '));
    var times = timesAndDistances.first
        .where((element) => element.isNotEmpty && element.isNumeric())
        .map((e) => int.parse(e))
        .toList();
    var distances = timesAndDistances.last
        .where((element) => element.isNotEmpty && element.isNumeric())
        .map((e) => int.parse(e))
        .toList();

    var races = IterableZip([times, distances]).map((e) => Race(e.first, e.last));

    List<int> allNumbersOfWaysWinningRaces = [];

    for (var race in races) {
      allNumbersOfWaysWinningRaces.add(race.numberOfWaysWinningTheRace());
    }

    var result = allNumbersOfWaysWinningRaces.reduce((value, element) => value * element);

    return result.toString();
  }

  @override
  String solveSecondPuzzle(String puzzleInput) {
    var timesAndDistances = puzzleInput.splitPerLine().map((e) => e.split(':'));

    var time = int.parse(timesAndDistances.first.last.replaceAll(' ', ''));
    var distance = int.parse(timesAndDistances.last.last.replaceAll(' ', ''));

    var race = Race(time, distance);

    var result = race.numberOfWaysWinningTheRace();

    return result.toString();
  }
}

class Race {
  final int _time;
  final int _distance;

  Race(this._time, this._distance);

  int numberOfWaysWinningTheRace() {
    var numberOfWaysWinningTheRace = 0;

    for (var i = 0; i < _time; i++) {
      var speed = i;
      var currentDistance = (_time - i) * speed;

      if (currentDistance > _distance) {
        numberOfWaysWinningTheRace++;
      }
    }

    return numberOfWaysWinningTheRace;
  }
}

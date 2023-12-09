import 'package:adventofcode2023/day.dart';
import 'package:adventofcode2023/helper/string_extensions.dart';
import 'package:collection/collection.dart';

class Day5 implements Day {
  @override
  int get dayNumber => 5;

  @override
  String solveFirstPuzzle(String puzzleInput) {
    var parts = puzzleInput.splitByEmptyLine();
    var rawSeeds = parts.first;
    var rawMappings = parts.where((element) => element != rawSeeds);

    var seeds = _getSeeds(rawSeeds);

    var mappings = rawMappings.map((e) => Mapping(e)).toList();

    List<int> locations = [];
    for (var seed in seeds) {
      int location = _mapSeedToLocation(seed, mappings);
      locations.add(location);
    }

    var result = locations.min;

    return result.toString();
  }

  @override
  String solveSecondPuzzle(String puzzleInput) {
    var parts = puzzleInput.splitByEmptyLine();
    var rawSeeds = parts.first;
    var rawMappings = parts.where((element) => element != rawSeeds);

    var seedRanges = _getSeedRanges(rawSeeds);
    var mappings = rawMappings.map((e) => Mapping(e)).toList();

    var lowestLocation = 0x7FFFFFFFFFFFFFFF;

    for (var seedRange in seedRanges) {
      var seeds = List.generate(seedRange.$2, (index) => seedRange.$1 + index, growable: false);

      for (var seed in seeds) {
        int location = _mapSeedToLocation(seed, mappings);

        if (location < lowestLocation) {
          lowestLocation = location;
        }
      }
    }

    var result = lowestLocation;

    return result.toString();
  }

  List<int> _getSeeds(String rawSeeds) {
    var seeds = rawSeeds
        .split(':')
        .last
        .split(' ')
        .where((element) => element.isNotEmpty)
        .map((e) => int.parse(e))
        .toList();

    return seeds;
  }

  int _mapSeedToLocation(int seed, List<Mapping> mappings) {
    var mappedValue = seed;

    for (var map in mappings) {
      mappedValue = map.mapValue(mappedValue);
    }

    return mappedValue;
  }

  List<(int, int)> _getSeedRanges(String rawSeeds) {
    var seedParts = rawSeeds
        .split(':')
        .last
        .split(' ')
        .where((element) => element.isNotEmpty)
        .map((e) => int.parse(e));

    List<(int, int)> seedRanges = [];

    for (var i = 0; i < seedParts.length - 1; i = i + 2) {
      var start = seedParts.elementAt(i);
      var length = seedParts.elementAt(i + 1);
      seedRanges.add((start, length));
    }

    return seedRanges;
  }
}

class Mapping {
  late String name;
  List<Range> ranges = [];

  Mapping(String rawMapping) {
    var parts = rawMapping.splitPerLine();
    name = parts.first;

    parts.where((element) => element != name).forEach((element) {
      ranges.add(Range(element));
    });
  }

  int mapValue(int value) {
    var mappedValue = value;

    for (var range in ranges) {
      mappedValue = range.mapValue(mappedValue);

      if (mappedValue != value) {
        return mappedValue;
      }
    }

    return mappedValue;
  }
}

class Range {
  late int sourceStart;
  late int destinationStart;
  late int length;

  Range(String rawRange) {
    var parts = rawRange.split(' ');
    sourceStart = int.parse(parts[1]);
    destinationStart = int.parse(parts[0]);
    length = int.parse(parts[2]);
  }

  int mapValue(int value) {
    if (sourceStart <= value && value < sourceStart + length) {
      var i = destinationStart + value - sourceStart;
      return i;
    }
    return value;
  }
}

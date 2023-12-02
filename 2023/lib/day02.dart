import 'package:adventofcode2023/day.dart';
import 'package:adventofcode2023/helper/string_extensions.dart';
import 'package:collection/collection.dart';

class Day2 implements Day {
  @override
  int get dayNumber => 2;

  @override
  String solveFirstPuzzle(String puzzleInput) {
    var games = puzzleInput.splitPerLine().map((e) {
      return Game(e);
    });

    var possibleGames = games.where((element) => element.isPossibleToPlay());

    var result = possibleGames.map((e) => e.id).sum;

    return result.toString();
  }

  @override
  String solveSecondPuzzle(String puzzleInput) {
    var games = puzzleInput.splitPerLine().map((e) {
      return Game(e);
    });

    var result = games.map((e) => e.power()).sum;

    return result.toString();
  }
}

class Game {
  num id = 0;
  List<Subset> subsets = [];

  Game(String rawGame) {
    var parts = rawGame.split(':');

    id = num.parse(parts.first.split(' ').last);

    subsets = parts.last.split(';').map((e) => Subset(e)).toList();
  }

  bool isPossibleToPlay() {
    return subsets.every((element) => element.isPossibleToPlay());
  }

  int power() {
    var red = subsets.map((e) => e.red).max;
    var green = subsets.map((e) => e.green).max;
    var blue = subsets.map((e) => e.blue).max;

    return red * green * blue;
  }
}

class Subset {
  List<Cube> cubes = [];

  int get red => cubes.where((element) => element.color == Color.red).length;
  int get green => cubes.where((element) => element.color == Color.green).length;
  int get blue => cubes.where((element) => element.color == Color.blue).length;

  Subset(String rawSubset) {
    rawSubset.trim().split(',').forEach((element) {
      var amountAndColor = element.trim().split(' ');

      var color = Color.values.byName(amountAndColor.last);
      var amount = int.parse(amountAndColor.first);

      cubes.addAll(List.generate(amount, (index) => Cube(color)));
    });
  }

  bool isPossibleToPlay() {
    if (red <= 12 && green <= 13 && blue <= 14) {
      return true;
    }

    return false;
  }
}

class Cube {
  Color color;

  Cube(this.color);
}

enum Color { red, green, blue }

import 'package:adventofcode2023/day.dart';
import 'package:collection/collection.dart';

class Day15 implements Day {
  @override
  int get dayNumber => 15;

  @override
  String solveFirstPuzzle(String puzzleInput) {
    var steps = puzzleInput.replaceAll('\n', '').split(',');

    var hashes = <int>[];

    for (var step in steps) {
      var value = hash(step);
      hashes.add(value);
    }

    var result = hashes.sum;
    return result.toString();
  }

  @override
  String solveSecondPuzzle(String puzzleInput) {
    var boxes = List.generate(256, (index) => Box()..id = index);
    var lenses = puzzleInput.replaceAll('\n', '').split(',').map((e) => Lens(e));

    for (var lense in lenses) {
      var hashValue = hash(lense.label);
      var box = boxes.singleWhere((element) => element.id == hashValue);

      if (lense.operation == '=') {
        if (box.lenses.any((element) => element.label == lense.label)) {
          var currentLense = box.lenses.firstWhere((element) => element.label == lense.label);
          var index = box.lenses.indexOf(currentLense);
          box.lenses[index] = lense;
        } else {
          box.lenses.add(lense);
        }
      }

      if (lense.operation == '-') {
        box.lenses.removeWhere((element) => element.label == lense.label);
      }
    }

    var result = boxes.map((e) => e.focusingPower()).sum;
    return result.toString();
  }

  int hash(String string) {
    var value = 0;

    for (var element in string.split('')) {
      var asciiCode = element.codeUnits.first;
      value += asciiCode;
      value *= 17;
      value = value % 256;
    }

    return value;
  }
}

class Lens {
  String label = '';
  String operation = '';
  int x = 0;

  Lens(String rawLens) {
    if (rawLens.contains('=')) {
      var split = rawLens.split('=');
      label = split.first;
      operation = '=';
      x = int.parse(split.last);
    }
    if (rawLens.contains('-')) {
      var split = rawLens.split('-');
      label = split.first;
      operation = '-';
    }
  }
}

class Box {
  int id = 0;
  List<Lens> lenses = [];

  int focusingPower() {
    var focusingPower = 0;

    for (var i = 0; i < lenses.length; i++) {
      var lens = lenses[i];

      var power = (1 + id) * (i + 1) * lens.x;
      focusingPower += power;
    }

    return focusingPower;
  }
}

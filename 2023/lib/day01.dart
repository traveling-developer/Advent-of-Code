import 'package:adventofcode2023/day.dart';
import 'package:adventofcode2023/helper/string_extensions.dart';
import 'package:collection/collection.dart';

class Day1 implements Day {
  @override
  int get dayNumber => 1;

  @override
  String solveFirstPuzzle(String puzzleInput) {
    var calibrationValues = puzzleInput.splitPerLine().map((e) {
      var firstAndLastDigit = e.split('').where((element) => element.isNumeric()).toList();
      return int.parse(firstAndLastDigit.first + firstAndLastDigit.last);
    }).toList();

    var result = calibrationValues.sum;

    return result.toString();
  }

  @override
  String solveSecondPuzzle(String puzzleInput) {
    var calibrationValues = puzzleInput.splitPerLine().map((e) {
      return getCalibrationValueFromLine(e);
    }).toList();

    var result = calibrationValues.sum;

    return result.toString();
  }

  int getCalibrationValueFromLine(String line) {
    List<(int, String)> indicesAndValues = [];

    for (var element in numbersAsString) {
      var firstIndex = line.indexOf(element);
      if (firstIndex != -1) {
        indicesAndValues.add((firstIndex, replaceSpelledOutDigitByDigit(element)));
      }

      var lastIndex = line.lastIndexOf(element);
      if (lastIndex != -1) {
        indicesAndValues.add((lastIndex, replaceSpelledOutDigitByDigit(element)));
      }
    }

    indicesAndValues.sortBy<num>((element) => element.$1);

    return int.parse(indicesAndValues.first.$2 + indicesAndValues.last.$2);
  }
}

String replaceSpelledOutDigitByDigit(String digit) {
  switch (digit) {
    case 'zero':
      return '0';
    case 'one':
      return '1';
    case 'two':
      return '2';
    case 'three':
      return '3';
    case 'four':
      return '4';
    case 'five':
      return '5';
    case 'six':
      return '6';
    case 'seven':
      return '7';
    case 'eight':
      return '8';
    case 'nine':
      return '9';
    default:
      return digit;
  }
}

const List<String> numbersAsString = [
  'zero',
  'one',
  'two',
  'three',
  'four',
  'five',
  'six',
  'seven',
  'eight',
  'nine',
  '1',
  '2',
  '3',
  '4',
  '5',
  '6',
  '7',
  '8',
  '9',
  '0',
];

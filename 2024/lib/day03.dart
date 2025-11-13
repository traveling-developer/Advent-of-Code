import 'package:adventofcode2024/day.dart';

class Day3 implements Day {
  @override
  int get dayNumber => 3;

  @override
  String solveFirstPuzzle(String puzzleInput) {
    RegExp regex = RegExp(r"mul\((\d{1,3}),(\d{1,3})\)");
    List<List<int>> tuples = regex.allMatches(puzzleInput).map((match) {
      return [int.parse(match.group(1)!), int.parse(match.group(2)!)];
    }).toList();

    var test = tuples.map((e) => e.first * e.last).reduce((value, element) => value + element);

    return test.toString();
  }

  @override
  String solveSecondPuzzle(String puzzleInput) {
    RegExp regex = RegExp(r"(mul\((\d{1,3}),(\d{1,3})\)|do\(\)|don't\(\))");
    var matches = regex.allMatches(puzzleInput).toList();
    var mulOn = true;
    var sum = 0;
    for (var match in matches) {
      var group = match.group(0);
      if (group == "do()") {
        mulOn = true;
      } else if (group == "don't()") {
        mulOn = false;
      } else if (mulOn == true) {
        var source = match.group(2)!;
        var x = int.parse(source);
        var source2 = match.group(3)!;
        var y = int.parse(source2);
        sum += (x * y);
      }
    }

    return sum.toString();
  }
}

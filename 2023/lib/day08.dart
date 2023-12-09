import 'package:adventofcode2023/day.dart';
import 'package:adventofcode2023/helper/iterable_extensions.dart';
import 'package:adventofcode2023/helper/string_extensions.dart';

class Day8 implements Day {
  @override
  int get dayNumber => 8;

  @override
  String solveFirstPuzzle(String puzzleInput) {
    var parts = puzzleInput.splitByEmptyLine();
    var directions = parts.first.split('');
    var nodes = parts.last.splitPerLine().map((e) => Node(e));

    var locationToNodeMap = {for (var item in nodes) item.location: item};

    var currentNode = locationToNodeMap['AAA']!;
    var steps = 0;

    while (currentNode.location != 'ZZZ') {
      for (var direction in directions) {
        if (direction == 'R') {
          currentNode = locationToNodeMap[currentNode.right]!;
        } else if (direction == 'L') {
          currentNode = locationToNodeMap[currentNode.left]!;
        }
        steps++;
      }
    }

    return steps.toString();
  }

  @override
  String solveSecondPuzzle(String puzzleInput) {
    var parts = puzzleInput.splitByEmptyLine();
    var directions = parts.first.split('');
    var nodes = parts.last.splitPerLine().map((e) => Node(e));

    var locationToNodeMap = {for (var item in nodes) item.location: item};

    var allNodesEndingWithA = nodes.where((element) => element.location.endsWith('A'));

    var allSteps = <int>[];
    for (var node in allNodesEndingWithA) {
      var currentNode = node;
      var steps = 0;

      while (!currentNode.location.endsWith('Z')) {
        for (var direction in directions) {
          if (direction == 'R') {
            currentNode = locationToNodeMap[currentNode.right]!;
          } else if (direction == 'L') {
            currentNode = locationToNodeMap[currentNode.left]!;
          }
          steps++;
          if (currentNode.location.endsWith('Z')) {
            break;
          }
        }
      }

      allSteps.add(steps);
    }

    var result = allSteps.leastCommonMultiple;

    return result.toString();
  }
}

class Node {
  String location;

  String left;
  String right;

  Node(String rawNode)
      : location = rawNode.substring(0, 3),
        left = rawNode.substring(7, 10),
        right = rawNode.substring(12, 15);
}

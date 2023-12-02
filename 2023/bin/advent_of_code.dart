import 'dart:async';

import 'package:adventofcode2023/advent_of_code_api.dart';
import 'package:adventofcode2023/day01.dart';
import 'package:adventofcode2023/day02.dart';

Future<void> main(List<String> arguments) async {
  final adventOfCode = AdventOfCode(arguments[0]);

  await solveDay(Day2(), adventOfCode);
  await solveDay(Day1(), adventOfCode);
}

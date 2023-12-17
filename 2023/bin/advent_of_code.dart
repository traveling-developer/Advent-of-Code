import 'dart:async';

import 'package:adventofcode2023/advent_of_code_api.dart';
import 'package:adventofcode2023/day01.dart';
import 'package:adventofcode2023/day02.dart';
import 'package:adventofcode2023/day03.dart';
import 'package:adventofcode2023/day04.dart';
import 'package:adventofcode2023/day05.dart';
import 'package:adventofcode2023/day06.dart';
import 'package:adventofcode2023/day07.dart';
import 'package:adventofcode2023/day08.dart';
import 'package:adventofcode2023/day09.dart';
import 'package:adventofcode2023/day11.dart';
import 'package:adventofcode2023/day15.dart';

Future<void> main(List<String> arguments) async {
  final adventOfCode = AdventOfCode(arguments[0]);

  await solveDay(Day15(), adventOfCode);
  await solveDay(Day11(), adventOfCode);
  await solveDay(Day9(), adventOfCode);
  await solveDay(Day8(), adventOfCode);
  await solveDay(Day7(), adventOfCode);
  await solveDay(Day6(), adventOfCode);
  await solveDay(Day5(), adventOfCode);
  await solveDay(Day4(), adventOfCode);
  await solveDay(Day3(), adventOfCode);
  await solveDay(Day2(), adventOfCode);
  await solveDay(Day1(), adventOfCode);
}

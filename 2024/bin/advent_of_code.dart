import 'package:adventofcode2024/advent_of_code_api.dart';
import 'package:adventofcode2024/day01.dart';
import 'package:adventofcode2024/day02.dart';
import 'package:adventofcode2024/day03.dart';
import 'package:adventofcode2024/day04.dart';
import 'package:adventofcode2024/day09.dart';
import 'package:adventofcode2024/day10.dart';

void main(List<String> arguments) async {
  final adventOfCode = AdventOfCode(arguments[0]);

  await solveDay(Day1(), adventOfCode);
  await solveDay(Day2(), adventOfCode);
  await solveDay(Day3(), adventOfCode);
  await solveDay(Day4(), adventOfCode);
  await solveDay(Day9(), adventOfCode);
  await solveDay(Day10(), adventOfCode);
  //await solveDay(Day9(), adventOfCode);
}

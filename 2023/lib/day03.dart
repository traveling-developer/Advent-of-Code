import 'package:adventofcode2023/day.dart';
import 'package:adventofcode2023/helper/cell.dart';
import 'package:adventofcode2023/helper/string_extensions.dart';
import 'package:adventofcode2023/helper/table.dart';
import 'package:collection/collection.dart';

class Day3 implements Day {
  @override
  int get dayNumber => 3;

  @override
  String solveFirstPuzzle(String puzzleInput) {
    var rows = puzzleInput.splitPerLine().map((e) => e.split(''));
    var table = Table(rows);

    var cellsWithSymbolsAsNeighbor = _getCellsWithSymbolsAsNeighbor(table);

    var partNumbers = _getPartNumbers(cellsWithSymbolsAsNeighbor, table);

    var result = partNumbers.sum;

    return result.toString();
  }

  @override
  String solveSecondPuzzle(String puzzleInput) {
    var rows = puzzleInput.splitPerLine().map((e) => e.split(''));
    var table = Table(rows);

    List<(Cell<String>, Iterable<Cell<String>>)> gearCellsWithNeighborPartNumberCells =
        _getGearCellsWithNeighborPartNumberCells(table);

    List<int> gearValues = _getGearValues(gearCellsWithNeighborPartNumberCells, table);

    var result = gearValues.sum;

    return result.toString();
  }

  List<int> _getGearValues(
      List<(Cell<String>, Iterable<Cell<String>>)> gearCellsWithNeighborPartNumberCells,
      Table<String> table) {
    List<int> gearValues = [];

    for (var gear in gearCellsWithNeighborPartNumberCells) {
      var gearPartNumbers = _getPartNumbers(gear.$2.toList(), table);

      if (gearPartNumbers.length == 2) {
        gearValues.add((gearPartNumbers.reduce((value, element) => value * element)));
      }
    }
    return gearValues;
  }

  List<(Cell<String>, Iterable<Cell<String>>)> _getGearCellsWithNeighborPartNumberCells(
      Table<String> table) {
    var possibleGears = table.asIterableCells().where((element) => element.value == '*');

    List<(Cell<String>, Iterable<Cell<String>>)> gearCellsWithNeighborPartNumberCells = [];

    for (var cell in possibleGears) {
      var neighbors = _getNeighborCells(cell, table);

      var partNumbers = neighbors.where((element) => element.value.isNumeric());

      if (partNumbers.length >= 2) {
        gearCellsWithNeighborPartNumberCells.add((cell, partNumbers));
      }
    }

    return gearCellsWithNeighborPartNumberCells;
  }

  List<Cell<String>> _getCellsWithSymbolsAsNeighbor(Table<String> table) {
    List<Cell<String>> cellsWithSymbolsAsNeighbor = [];

    for (var cell in table.asIterableCells()) {
      if (!cell.value.isNumeric()) {
        continue;
      }
      var neighbors = _getNeighborCells(cell, table);

      if (neighbors.any((element) => element.value != '.' && !element.value.isNumeric())) {
        cellsWithSymbolsAsNeighbor.add(cell);
      }
    }
    return cellsWithSymbolsAsNeighbor;
  }

  Iterable<int> _getPartNumbers(
      List<Cell<String>> cellsWithSymbolsAsNeighbor, Table<String> table) {
    List<(int, Cell<String>)> partNumbersWithCells = [];

    for (var cell in cellsWithSymbolsAsNeighbor) {
      var partNumber = _getPartNumberFromCell(cell, table);

      var partNumberWithCell = (partNumber, cell);

      if (_partNumbersWithCellsAlreadyContainsPartNumber(
          partNumbersWithCells, partNumberWithCell)) {
        continue;
      }

      partNumbersWithCells.add(partNumberWithCell);
    }

    return partNumbersWithCells.map((e) => e.$1);
  }

  bool _partNumbersWithCellsAlreadyContainsPartNumber(
      List<(int, Cell<String>)> partNumbersWithCells, (int, Cell<String>) partNumberWithCell) {
    return partNumbersWithCells.any((element) {
      return element.$1 == partNumberWithCell.$1 &&
          element.$2.y == partNumberWithCell.$2.y &&
          (element.$2.x - partNumberWithCell.$2.x).abs() < 4;
    });
  }

  int _getPartNumberFromCell(Cell<String> cell, Table<String> table) {
    String partNumber = cell.value;

    var leftNeighborCells = _getLeftNeighborCells(cell, table);
    var rightNeighborCells = _getRightNeighborCells(cell, table);

    for (var element in leftNeighborCells) {
      if (!element.value.isNumeric()) {
        break;
      }
      partNumber = element.value + partNumber;
    }

    for (var element in rightNeighborCells) {
      if (!element.value.isNumeric()) {
        break;
      }
      partNumber = partNumber + element.value;
    }

    return int.parse(partNumber);
  }

  List<Cell<String>> _getNeighborCells(Cell<String> cell, Table<String> table) {
    var x = cell.x;
    var y = cell.y;

    var neighborCoordinates = {
      (y - 1, x),
      (y + 1, x),
      (y - 1, x + 1),
      (y - 1, x - 1),
      (y + 1, x - 1),
      (y + 1, x + 1),
      (y, x + 1),
      (y, x - 1)
    };

    List<Cell<String>> neighborValues = [];

    for (var element in neighborCoordinates) {
      try {
        neighborValues.add(Cell(element.$2, element.$1, table.getValue(element.$1, element.$2)));
      } catch (e) {}
    }
    return neighborValues;
  }

  List<Cell<String>> _getLeftNeighborCells(Cell<String> cell, Table<String> table) {
    var x = cell.x;
    var y = cell.y;

    var neighborCoordinates = {(y, x - 1), (y, x - 2)};

    List<Cell<String>> neighborValues = [];

    for (var element in neighborCoordinates) {
      try {
        neighborValues.add(Cell(element.$2, element.$1, table.getValue(element.$1, element.$2)));
      } catch (e) {}
    }
    return neighborValues;
  }

  List<Cell<String>> _getRightNeighborCells(Cell<String> cell, Table<String> table) {
    var x = cell.x;
    var y = cell.y;

    var neighborCoordinates = {(y, x + 1), (y, x + 2)};

    List<Cell<String>> neighborValues = [];

    for (var element in neighborCoordinates) {
      try {
        neighborValues.add(Cell(element.$2, element.$1, table.getValue(element.$1, element.$2)));
      } catch (e) {}
    }
    return neighborValues;
  }
}

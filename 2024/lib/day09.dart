import 'package:adventofcode2024/day.dart';

class Day9 implements Day {
  @override
  int get dayNumber => 9;

  @override
  String solveFirstPuzzle(String puzzleInput) {
    /*  puzzleInput = puzzleInput.substring(0, puzzleInput.length - 1);
    puzzleInput += "0";
    var tuples = [];
    for (int i = 0; i < puzzleInput.length; i += 2) {
      tuples.add(puzzleInput.substring(i, i + 2));
    }
    var blocks = <FileBlock>[];
    num id = 0;
    for (var block in tuples) {
      var numberOfBlocks = int.parse(block[0]);
      var numberOfFreeSpaces = int.parse(block[1]);
      for (var i = 0; i < numberOfBlocks; i++) {
        blocks.add(FileBlock(id, false));
      }
      for (var i = 0; i < numberOfFreeSpaces; i++) {
        blocks.add(FileBlock.empty());
      }
      id++;
    }

    while (blocks.any((x) => x.isEmpty == true)) {
      var firstEmpty = blocks.indexed.firstWhere((x) => x.$2.isEmpty == true);
      var last = blocks.indexed.lastWhere((x) => x.$2.isEmpty == false);

      blocks.swap(firstEmpty.$1, last.$1);

      if (blocks.last.isEmpty == true) {
        blocks.remove(blocks.last);
      }
    }

    num sum = 0;
    for (var element in blocks.indexed) {
      sum += (element.$1 * element.$2.id);
    }

    return sum.toString();*/
    return "";
  }

  @override
  String solveSecondPuzzle(String puzzleInput) {
    puzzleInput = puzzleInput.substring(0, puzzleInput.length - 1);
    puzzleInput += "0";
    var blocks = parseDiskMap(puzzleInput);
    var test = blocks.join();
    name(test);

    return "";
    //puzzleInput = puzzleInput.substring(0, puzzleInput.length - 1);

    //puzzleInput = puzzleInput.substring(0, puzzleInput.length - 1);
    /* puzzleInput += "0";
    var tuples = [];
    for (int i = 0; i < puzzleInput.length; i += 2) {
      tuples.add(puzzleInput.substring(i, i + 2));
    }
    var blocks = <FileBlock>[];
    num id = 0;
    for (var block in tuples) {
      var numberOfBlocks = int.parse(block[0]);
      var numberOfFreeSpaces = int.parse(block[1]);
      blocks.add(FileBlock.length(id, numberOfBlocks, false));
      blocks.add(FileBlock.length(-1, numberOfFreeSpaces, true));
      id++;
    }

    for (var block in blocks.reversed.toList()) {
      if (block.id == 0) {
        continue;
      }
      if (block.isEmpty == true) {
        continue;
      }
      var fittingOne = blocks.firstWhere((x) => x.isEmpty && x.length >= block.length,
          orElse: () => FileBlock(-9, true));

      if (fittingOne.id == -9) {
        continue;
      }

      var index = blocks.indexOf(block);
      var indexOf = blocks.indexOf(fittingOne);

      if (indexOf > index) {
        continue;
      }

      blocks.insert(index, FileBlock.length(-1, block.length, true));

      blocks.remove(block);

      if (fittingOne.length == block.length) {
        blocks[indexOf] = block;
      } else if (fittingOne.length > block.length) {
        fittingOne.length -= block.length;
        blocks.insert(indexOf, block);
      }

      print("object");
    }

    num sum = 0;
    for (var element in blocks.indexed) {
      sum += (element.$1 * element.$2.id);
    }

    return sum.toString();*/
  }

  List<String> parseDiskMap(String diskMap) {
    List<String> blocks = [];
    int fileId = 0;

    for (int i = 0; i < diskMap.length; i += 2) {
      int fileSize = int.parse(diskMap[i]);
      int freeSize = int.parse(diskMap[i + 1]);

      // Add file blocks
      blocks.addAll(List.filled(fileSize, fileId.toString()));

      // Add free space
      blocks.addAll(List.filled(freeSize, "."));

      // Increment file ID
      fileId++;
    }

    return blocks;
  }

  void name(String input) {
    // Parse the input into a list of characters
    List<String> disk = input.split("");

    // Identify file groups
    Map<int, List<int>> fileGroups = {};
    String currentFile = "";
    int start = 0;

    for (int i = 0; i <= disk.length; i++) {
      if (i == disk.length || disk[i] != currentFile) {
        if (currentFile != "." && currentFile.isNotEmpty) {
          int fileId = int.parse(currentFile);
          fileGroups[fileId] ??= [];
          fileGroups[fileId]!.addAll(List.generate(i - start, (j) => start + j));
        }
        if (i < disk.length) {
          currentFile = disk[i];
          start = i;
        }
      }
    }

    // Process files in decreasing file ID order
    var sortedFileIds = fileGroups.keys.toList()..sort((a, b) => b.compareTo(a));

    for (var fileId in sortedFileIds) {
      var filePositions = fileGroups[fileId]!;
      int fileSize = filePositions.length;

      // Find the leftmost contiguous free space
      int freeSpaceStart = -1;
      for (int i = 0; i <= disk.length - fileSize; i++) {
        if (disk.sublist(i, i + fileSize).every((c) => c == ".")) {
          freeSpaceStart = i;
          break;
        }
      }

      // Move the file if space is found
      if (freeSpaceStart != -1 && freeSpaceStart < filePositions.first) {
        // Clear current positions
        for (var pos in filePositions) {
          disk[pos] = ".";
        }
        // Fill new positions
        for (int i = 0; i < fileSize; i++) {
          disk[freeSpaceStart + i] = fileId.toString();
        }
      }
    }

    // Calculate checksum

    BigInt checksum = BigInt.zero;
    for (int i = 0; i < disk.length; i++) {
      if (disk[i] != ".") {
        checksum += BigInt.from(i) * BigInt.parse(disk[i]);
      }
    }

    print("Final Disk State: ${disk.join()}");
    print("Checksum: $checksum"); //_BigIntImpl (116797736564) too low
  }
}

class FileBlock {
  FileBlock(this.id, this.isEmpty);
  FileBlock.empty();
  FileBlock.length(this.id, this.length, this.isEmpty);

  num id = -1;
  bool isEmpty = true;
  num length = -1;
}

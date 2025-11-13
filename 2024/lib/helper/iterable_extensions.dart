import 'package:adventofcode2024/helper/int_extensions.dart';

extension IterableIntegerExtension on Iterable<int> {
  int get leastCommonMultiple {
    return reduce((value, element) => value.lcm(element));
  }

  int get lcm {
    return leastCommonMultiple;
  }
}

extension test on List {
  void swap(int index1, int index2) {
    RangeError.checkValidIndex(index1, this, 'index1');
    RangeError.checkValidIndex(index2, this, 'index2');
    var tmp = this[index1];
    this[index1] = this[index2];
    this[index2] = tmp;
  }
}

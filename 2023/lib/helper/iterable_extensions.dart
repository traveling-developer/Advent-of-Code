import 'package:adventofcode2023/helper/int_extensions.dart';

extension IterableIntegerExtension on Iterable<int> {
  int get leastCommonMultiple {
    return reduce((value, element) => value.lcm(element));
  }

  int get lcm {
    return leastCommonMultiple;
  }
}

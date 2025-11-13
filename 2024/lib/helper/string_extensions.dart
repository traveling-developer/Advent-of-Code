extension StringSplitting on String {
  Iterable<String> splitPerLine() {
    return split('\n').where((element) => element.isNotEmpty);
  }

  Iterable<String> splitByEmptyLine() {
    return split('\n\n').where((element) => element.isNotEmpty);
  }
}

extension IsNumeric on String {
  bool isNumeric() {
    return num.tryParse(this) != null;
  }
}

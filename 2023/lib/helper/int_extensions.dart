extension ArithmeticExtensions on int {
  int leastCommonMultiple(int other) {
    return (this * other) ~/ gcd(other);
  }

  int lcm(int other) {
    return leastCommonMultiple(other);
  }
}

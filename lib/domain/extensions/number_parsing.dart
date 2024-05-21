extension NumberParsing on double {
  String toHex() {
    return int.parse(truncate().toString())
        .toInt()
        .toRadixString(16)
        .padLeft(2, '0');
  }

  String toUpperCasedHex() {
    return toHex().toUpperCase();
  }

  String toRGB() {
    return truncate().toString().padLeft(3, '0');
  }
}

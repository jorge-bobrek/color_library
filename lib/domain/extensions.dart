import 'dart:ui';

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}

extension NumberParsing on double {
  String toHex() {
    return int.parse(truncate().toString())
        .toInt()
        .toRadixString(16)
        .padLeft(2, '0');
  }

  String toRGB() {
    return truncate().toString().padLeft(3, '0');
  }
}

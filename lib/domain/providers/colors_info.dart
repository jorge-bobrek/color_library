import 'package:color_library/domain/models/color_item.dart';
import 'package:flutter/material.dart';

class ColorsInfo with ChangeNotifier {
  final List<ColorItem> _colors = [
    ColorItem(15, 89, 91)
  ];

  /// Current list of colors
  List<ColorItem> get colors {
    return _colors;
  }

  /// Adds a new [color] to the list
  void addColor(ColorItem color) {
    _colors.add(color);
    notifyListeners();
  }

  /// Removes [color] from the list
  void removeColor(ColorItem color) {
    _colors.remove(color);
    notifyListeners();
  }

  /// Replaces [color] with its current color
  void replaceColor(ColorItem color) {
    final index = _colors.indexOf(color);
    _colors[index] = color;
    notifyListeners();
  }
}

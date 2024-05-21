import 'package:color_library/domain/models/color_item.dart';
import 'package:flutter/material.dart';

class ColorDetailProvider with ChangeNotifier {
  ColorDetailProvider(this._color);
  ColorItem _color;

  /// Set currently selected color
  set color(color) {
    _color = color;
    notifyListeners();
  }

  /// Change [name] value for currently selected color
  setName(String name) {
    _color.name = name;
    notifyListeners();
  }

  /// Change [red] value for currently selected color
  setRed(double red) {
    _color.red = red;
    notifyListeners();
  }

  /// Change [green] value for currently selected color
  setGreen(double green) {
    _color.green = green;
    notifyListeners();
  }

  /// Change [blue] value for currently selected color
  setBlue(double blue) {
    _color.blue = blue;
    notifyListeners();
  }

  /// Get currently selected color
  ColorItem get color {
    return _color;
  }
}

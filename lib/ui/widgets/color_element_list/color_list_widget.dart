import 'package:color_library/domain/models/color_item.dart';
import 'package:color_library/ui/widgets/color_element_list/color_element/color_element_widget.dart';
import 'package:flutter/material.dart';

class ColorListWidget extends StatelessWidget {
  const ColorListWidget({super.key, required this.colors});
  final List<ColorItem> colors;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      restorationId: "colorElementListView",
      itemCount: colors.length,
      itemBuilder: (BuildContext context, int index) {
        final color = colors[index];
        return ColorElement(color);
      },
    );
  }
}
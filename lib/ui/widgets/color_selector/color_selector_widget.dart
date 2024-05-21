import 'package:color_library/domain/models/color_item.dart';
import 'package:color_library/domain/providers/color_detail_provider.dart';
import 'package:color_library/ui/widgets/color_selector/color_preview_widget.dart';
import 'package:color_library/ui/widgets/color_selector/color_slider_widget.dart';
import 'package:flutter/material.dart';
import "package:provider/provider.dart";

class ColorSelectorWidget extends StatefulWidget {
  const ColorSelectorWidget(this.color, {super.key});
  final ColorItem color;

  @override
  State<ColorSelectorWidget> createState() => _ColorSelectorWidgetState();
}

class _ColorSelectorWidgetState extends State<ColorSelectorWidget> {
  @override
  Widget build(BuildContext context) {
    final colorDetail = Provider.of<ColorDetailProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ColorPreviewWidget(color: colorDetail.color),
          const SizedBox(height: 20),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ColorSliderWidget(
                label: "R",
                value: colorDetail.color.red,
                color: colorDetail.color,
                onChanged: (value) =>
                    setState(() => colorDetail.setRed(value)),
              ),
              const SizedBox(height: 10),
              ColorSliderWidget(
                label: "G",
                value: colorDetail.color.green,
                color: colorDetail.color,
                onChanged: (value) =>
                    setState(() => colorDetail.setGreen(value)),
              ),
              const SizedBox(height: 10),
              ColorSliderWidget(
                label: "B",
                value: colorDetail.color.blue,
                color: colorDetail.color,
                onChanged: (value) =>
                    setState(() => colorDetail.setBlue(value)),
              ),
            ],
          )
        ],
      ),
    );
  }
}

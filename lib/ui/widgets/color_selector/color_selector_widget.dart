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
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorDetail = Provider.of<ColorDetailProvider>(context);
    _controller.text = colorDetail.color.name;
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text(
                "Nombre:",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: TextField(
                  controller: _controller,
                  textCapitalization: TextCapitalization.words,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: 'Nombre del color',
                    errorText:
                        _controller.text.isEmpty ? "No debe estar vacío" : null,
                  ),
                  onChanged: (str) {
                    colorDetail.setName(str);
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          ColorPreviewWidget(color: colorDetail.color),
          const SizedBox(height: 20),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ColorSliderWidget(
                label: "R",
                value: colorDetail.color.red,
                color: colorDetail.color,
                onChanged: (value) => setState(() => colorDetail.setRed(value)),
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

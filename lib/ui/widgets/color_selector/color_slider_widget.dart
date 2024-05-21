import 'package:color_library/domain/extensions/hex_color.dart';
import 'package:color_library/domain/extensions/number_parsing.dart';
import 'package:color_library/domain/models/color_item.dart';
import 'package:color_library/ui/widgets/color_selector/decimal_number_widget.dart';
import 'package:flutter/material.dart';

class ColorSliderWidget extends StatefulWidget {
  const ColorSliderWidget(
      {super.key,
      required this.label,
      required this.value,
      required this.color,
      required this.onChanged});
  final String label;
  final double value;
  final ColorItem color;
  final ValueChanged<double> onChanged;

  @override
  State<ColorSliderWidget> createState() => _ColorSliderWidgetState();
}

class _ColorSliderWidgetState extends State<ColorSliderWidget> {
  @override
  Widget build(BuildContext context) {
    Color startColor;
    Color endColor;
    switch (widget.label) {
      case "R":
        startColor = HexColor(
            "00${widget.color.green.toHex()}${widget.color.blue.toHex()}");
        endColor = HexColor(
            "FF${widget.color.green.toHex()}${widget.color.blue.toHex()}");
        break;
      case "G":
        startColor = HexColor(
            "${widget.color.red.toHex()}00${widget.color.blue.toHex()}");
        endColor = HexColor(
            "${widget.color.red.toHex()}FF${widget.color.blue.toHex()}");
        break;
      case "B":
        startColor = HexColor(
            "${widget.color.red.toHex()}${widget.color.green.toHex()}00");
        endColor = HexColor(
            "${widget.color.red.toHex()}${widget.color.green.toHex()}FF");
        break;
      default:
        startColor = Colors.transparent;
        endColor = Colors.transparent;
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(
          width: 26,
          child: Text(
            "${widget.label}:",
            style: const TextStyle(
              fontSize: 24,
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Material(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32),
                  border: Border.all(color: Colors.grey.shade300),
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: <Color>[
                      startColor,
                      endColor,
                    ],
                    tileMode: TileMode.mirror,
                  ),
                ),
                child: Slider(
                  min: 0.0,
                  max: 255.0,
                  activeColor: Colors.white70,
                  value: widget.value,
                  onChanged: widget.onChanged,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          width: 35,
          child: DecimalNumberWidget(label: widget.label),
        )
      ],
    );
  }
}

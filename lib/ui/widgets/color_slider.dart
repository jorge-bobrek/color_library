import 'package:color_library/domain/models/color_item.dart';
import 'package:flutter/material.dart';
import 'package:color_library/domain/extensions.dart';

class ColorSlider extends StatefulWidget {
  final ColorItem color;
  const ColorSlider(this.color, {super.key});

  @override
  State<ColorSlider> createState() => _ColorSliderState();
}

class _ColorSliderState extends State<ColorSlider> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildColorPreview(),
          const SizedBox(height: 20),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildColorSlider("R", widget.color.red,
                  (value) => setState(() => widget.color.red = value)),
              const SizedBox(height: 10),
              _buildColorSlider("G", widget.color.green,
                  (value) => setState(() => widget.color.green = value)),
              const SizedBox(height: 10),
              _buildColorSlider("B", widget.color.blue,
                  (value) => setState(() => widget.color.blue = value)),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildColorPreview() {
    return Container(
      width: double.infinity,
      height: 96,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color.fromRGBO(widget.color.red.toInt(),
            widget.color.green.toInt(), widget.color.blue.toInt(), 1),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Stack(
          children: <Widget>[
            Text(
              "#${widget.color.red.toHex().toUpperCase()}"
              "${widget.color.green.toHex().toUpperCase()}"
              "${widget.color.blue.toHex().toUpperCase()}",
              style: TextStyle(
                fontSize: 40,
                foreground: Paint()
                  ..style = PaintingStyle.stroke
                  ..strokeWidth = 4
                  ..color = Colors.white,
              ),
            ),
            Text(
              "#${widget.color.red.toHex().toUpperCase()}"
              "${widget.color.green.toHex().toUpperCase()}"
              "${widget.color.blue.toHex().toUpperCase()}",
              style: const TextStyle(
                fontSize: 40,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildColorSlider(
      String label, double value, ValueChanged<double> onChanged) {
    Color startColor;
    Color endColor;
    switch (label) {
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
          width: 85,
          child: Text(
            "$label: ${value.toInt().toString()}",
            style: const TextStyle(
              fontSize: 24,
            ),
          ),
        ),
        Expanded(
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
                value: value,
                onChanged: onChanged,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

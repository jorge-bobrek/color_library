import 'package:color_library/domain/extensions/number_parsing.dart';
import 'package:color_library/domain/models/color_item.dart';
import 'package:flutter/material.dart';

class ColorPreviewWidget extends StatefulWidget {
  const ColorPreviewWidget({super.key, required this.color});
  final ColorItem color;

  @override
  State<ColorPreviewWidget> createState() => _ColorPreviewWidgetState();
}

class _ColorPreviewWidgetState extends State<ColorPreviewWidget> {
  @override
  Widget build(BuildContext context) {
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
              "#${widget.color.red.toUpperCasedHex()}"
              "${widget.color.green.toUpperCasedHex()}"
              "${widget.color.blue.toUpperCasedHex()}",
              style: TextStyle(
                fontSize: 40,
                foreground: Paint()
                  ..style = PaintingStyle.stroke
                  ..strokeWidth = 4
                  ..color = Colors.white,
              ),
            ),
            Text(
              "#${widget.color.red.toUpperCasedHex()}"
              "${widget.color.green.toUpperCasedHex()}"
              "${widget.color.blue.toUpperCasedHex()}",
              style: const TextStyle(
                fontSize: 40,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
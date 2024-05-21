
import 'package:color_library/domain/models/color_item.dart';
import 'package:flutter/material.dart';

class ColorCircleWidget extends StatelessWidget {
  const ColorCircleWidget({required this.color, super.key});
  final ColorItem color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 64,
      height: 64,
      decoration: BoxDecoration(
        color: Color.fromRGBO(
            color.red.toInt(), color.green.toInt(), color.blue.toInt(), 1),
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.4),
            spreadRadius: 2,
            blurRadius: 3,
          ),
        ],
      ),
    );
  }
}
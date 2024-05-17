import 'package:color_library/domain/extensions.dart';
import 'package:color_library/ui/pages/color_element_detail.dart';
import 'package:color_library/domain/models/color_item.dart';
import 'package:flutter/material.dart';

class ColorElement extends StatelessWidget {
  final ColorItem color;

  const ColorElement(this.color, {super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: ((context) => ColorElementDetail(color: color)),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Container(
          width: double.infinity,
          height: 96,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
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
            child: Row(
              children: [
                _buildColorCircle(color),
                const SizedBox(width: 25),
                Text(
                  "#${color.red.toHex().toUpperCase()}${color.green.toHex().toUpperCase()}${color.blue.toHex().toUpperCase()}",
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildColorCircle(ColorItem color) {
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

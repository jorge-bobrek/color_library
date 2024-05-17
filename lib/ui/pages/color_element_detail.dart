import "package:color_library/domain/models/color_item.dart";
import "package:color_library/domain/providers/colors_info.dart";
import "package:color_library/ui/widgets/color_slider.dart";
import "package:flutter/material.dart";
import "package:provider/provider.dart";

class ColorElementDetail extends StatefulWidget {
  final ColorItem color;
  final bool editing;
  const ColorElementDetail({
    required this.color,
    this.editing = true,
    super.key,
  });

  @override
  State<ColorElementDetail> createState() => _ColorElementDetailState();
}

class _ColorElementDetailState extends State<ColorElementDetail> {
  @override
  Widget build(BuildContext context) {
    final colorsInfo = Provider.of<ColorsInfo>(context);
    final isEditing = widget.editing;

    return Scaffold(
      appBar: AppBar(
        title: Text(isEditing ? "Edit color" : "Create new color"),
      ),
      body: SafeArea(
        child: Column(
          children: [
            ColorSlider(widget.color),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  const Spacer(),
                  _buildButton(
                    text: isEditing ? "Delete" : "Cancel",
                    onPressed: () {
                      if (isEditing) {
                        colorsInfo.removeColor(widget.color);
                      }
                      Navigator.pop(context);
                    },
                    color: Colors.red,
                  ),
                  const SizedBox(width: 10),
                  _buildButton(
                    text: "Save",
                    onPressed: () {
                      if (isEditing) {
                        colorsInfo.replaceColor(widget.color);
                      } else {
                        colorsInfo.addColor(widget.color);
                      }
                      Navigator.pop(context);
                    },
                    color: Colors.green,
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButton({
    required String text,
    required VoidCallback onPressed,
    required Color color,
  }) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: color,
        minimumSize: const Size(170, 48),
      ),
      onPressed: onPressed,
      child: Text(text),
    );
  }
}

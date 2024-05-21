import "package:color_library/domain/providers/color_detail_provider.dart";
import "package:color_library/domain/providers/color_list_provider.dart";
import "package:color_library/ui/widgets/color_element_detail/action_button_widget.dart";
import "package:color_library/ui/widgets/color_selector/color_selector_widget.dart";
import "package:flutter/material.dart";
import "package:provider/provider.dart";

class ColorElementDetailPage extends StatefulWidget {
  const ColorElementDetailPage({
    this.editing = true,
    super.key,
  });
  final bool editing;

  @override
  State<ColorElementDetailPage> createState() => _ColorElementDetailPageState();
}

class _ColorElementDetailPageState extends State<ColorElementDetailPage> {
  @override
  Widget build(BuildContext context) {
    final colorList = Provider.of<ColorListProvider>(context);
    final colorDetail = Provider.of<ColorDetailProvider>(context);
    final isEditing = widget.editing;

    return Scaffold(
      appBar: AppBar(
        title: Text(isEditing ? "Editar color" : "Crear color"),
      ),
      resizeToAvoidBottomInset: false, 
      body: SafeArea(
        child: Column(
          children: [
            ColorSelectorWidget(colorDetail.color),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  const Spacer(),
                  ActionButtonWidget(
                    text: isEditing ? "Eliminar" : "Cancelar",
                    onPressed: () {
                      if (isEditing) {
                        colorList.removeColor(colorDetail.color);
                      }
                      Navigator.pop(context);
                    },
                    color: Colors.red,
                  ),
                  const SizedBox(width: 10),
                  ActionButtonWidget(
                    text: "Guardar",
                    onPressed: () {
                      if (colorDetail.color.name.isNotEmpty) {
                        if (isEditing) {
                          colorList.replaceColor(colorDetail.color);
                        } else {
                          colorList.addColor(colorDetail.color);
                        }
                        Navigator.pop(context);
                      }
                    },
                    color: colorDetail.color.name.isNotEmpty
                        ? Colors.green
                        : Colors.green.shade100,
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
}

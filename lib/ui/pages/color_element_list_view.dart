import 'package:color_library/domain/providers/colors_info.dart';
import 'package:color_library/ui/pages/color_element_detail.dart';
import 'package:color_library/domain/models/color_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/color_element.dart';

class ColorElementListView extends StatelessWidget {
  const ColorElementListView({super.key});

  @override
  Widget build(BuildContext context) {
    final colorsInfo = Provider.of<ColorsInfo>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Color Library"),
      ),
      body: _buildColorListView(colorsInfo.colors),
      floatingActionButton: _buildAddButton(context),
    );
  }

  Widget _buildColorListView(List<ColorItem> colors) {
    return ListView.builder(
      restorationId: "colorElementListView",
      itemCount: colors.length,
      itemBuilder: (BuildContext context, int index) {
        final color = colors[index];
        return ColorElement(color);
      },
    );
  }

  Widget _buildAddButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: <Color>[
              Color(0xFFFF0064),
              Color(0xFFFF7600),
              Color(0xFFFFD500),
              Color(0xFF8CFE00),
              Color(0xFF00E86C),
              Color(0xFF00F4F2),
              Color(0xFF00CCFF),
              Color(0xFF70A2FF),
              Color(0xFFA96CFF),
            ],
          ),
        ),
        child: FloatingActionButton.extended(
          elevation: 0,
          onPressed: () => _navigateToAddColor(context),
          label: const Text("Add"),
          icon: const Icon(Icons.add),
          backgroundColor: Colors.transparent,
        ),
      ),
    );
  }

  void _navigateToAddColor(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            ColorElementDetail(color: ColorItem(0, 0, 0), editing: false),
      ),
    );
  }
}

import 'package:color_library/domain/providers/color_detail_provider.dart';
import 'package:color_library/domain/providers/color_list_provider.dart';
import 'package:color_library/ui/pages/color_element_detail_page.dart';
import 'package:color_library/domain/models/color_item.dart';
import 'package:color_library/ui/widgets/color_element_list/add_button_widget.dart';
import 'package:color_library/ui/widgets/color_element_list/color_list_widget.dart';
import 'package:color_library/ui/widgets/color_element_list/empty_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ColorElementListPage extends StatelessWidget {
  const ColorElementListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final colorsInfo = Provider.of<ColorListProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Librería De Colores"),
      ),
      body: SafeArea(
        child: colorsInfo.colors.isNotEmpty
            ? ColorListWidget(colors: colorsInfo.colors)
            : const EmptyWidget(),
      ),
      floatingActionButton: AddButtonWidget(
        onPressed: () => _navigateToAddColor(context),
      ),
    );
  }

  void _navigateToAddColor(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ChangeNotifierProvider(
          create: (context) => ColorDetailProvider(ColorItem(0, 0, 0)),
          child: const ColorElementDetailPage(editing: false),
        ),
      ),
    );
  }
}

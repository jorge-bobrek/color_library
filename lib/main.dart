import 'package:color_library/domain/providers/colors_info.dart';
import 'package:color_library/ui/pages/color_element_list_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ColorsInfo(),
      child: const MaterialApp(
        home: Scaffold(
          body: Center(child: ColorElementListView()),
        ),
      ),
    );
  }
}

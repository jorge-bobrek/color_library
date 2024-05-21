import 'package:color_library/domain/providers/color_list_provider.dart';
import 'package:color_library/ui/pages/color_element_list_page.dart';
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
      create: (context) => ColorListProvider(),
      child: const MaterialApp(
        home: Scaffold(
          body: Center(child: ColorElementListPage()),
        ),
      ),
    );
  }
}

import 'package:color_library/domain/extensions/number_parsing.dart';
import 'package:color_library/domain/providers/color_detail_provider.dart';
import 'package:color_library/ui/pages/color_element_detail_page.dart';
import 'package:color_library/domain/models/color_item.dart';
import 'package:color_library/ui/widgets/color_element_list/color_element/color_circle_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ColorElement extends StatelessWidget {
  const ColorElement(this.color, {super.key});
  final ColorItem color;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: ((context) => ChangeNotifierProvider(
                create: (context) => ColorDetailProvider(color),
                child: const ColorElementDetailPage())),
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
                ColorCircleWidget(color: color),
                const SizedBox(width: 25),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      color.name,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      "#${color.red.toUpperCasedHex()}${color.green.toUpperCasedHex()}${color.blue.toUpperCasedHex()}",
                      style: const TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

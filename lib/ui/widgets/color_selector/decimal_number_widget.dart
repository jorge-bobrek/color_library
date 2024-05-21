import 'package:color_library/domain/providers/color_detail_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class DecimalNumberWidget extends StatefulWidget {
  const DecimalNumberWidget({super.key, required this.label});
  final String label;

  @override
  State<DecimalNumberWidget> createState() => _DecimalNumberWidgetState();
}

class _DecimalNumberWidgetState extends State<DecimalNumberWidget> {
  final TextEditingController _controller = TextEditingController();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final colorDetail = Provider.of<ColorDetailProvider>(context);
    switch (widget.label) {
      case "R":
        _controller.text = colorDetail.color.red.toInt().toString();
        break;
      case "G":
        _controller.text = colorDetail.color.green.toInt().toString();
        break;
      case "B":
        _controller.text = colorDetail.color.blue.toInt().toString();
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Focus(
      onFocusChange: (hasFocus) {
        if (!hasFocus && _controller.text.isEmpty) {
          setState(() {
            _controller.text = '0';
            _updateProvider(0);
          });
        }
      },
      child: TextField(
        controller: _controller,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
        ],
        onChanged: (value) {
          int? number = int.tryParse(value);
          if (number == null) {
            _updateProvider(0);
          } else if (number >= 0 && number <= 255) {
            _updateProvider(number);
          } else if (number > 255) {
            _controller.text = '255';
            _updateProvider(255);
          }
        },
      ),
    );
  }

  void _updateProvider(int value) {
    final colorProvider =
        Provider.of<ColorDetailProvider>(context, listen: false);
    switch (widget.label) {
      case "R":
        colorProvider.setRed(value.toDouble());
        break;
      case "G":
        colorProvider.setGreen(value.toDouble());
        break;
      case "B":
        colorProvider.setBlue(value.toDouble());
        break;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

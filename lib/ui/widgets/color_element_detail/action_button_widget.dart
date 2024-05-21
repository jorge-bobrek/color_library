import 'package:flutter/material.dart';

class ActionButtonWidget extends StatelessWidget {
  const ActionButtonWidget({super.key, required this.onPressed, required this.color, required this.text});
    final VoidCallback onPressed;
    final Color color;
    final String text;

  @override
  Widget build(BuildContext context) {
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
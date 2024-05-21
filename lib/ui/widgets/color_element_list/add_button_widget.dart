import 'package:flutter/material.dart';

class AddButtonWidget extends StatelessWidget {
  const AddButtonWidget({super.key, required this.onPressed});
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
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
          onPressed: onPressed,
          label: const Text("Agregar"),
          icon: const Icon(Icons.add),
          backgroundColor: Colors.transparent,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController controller;
  int? maxLines = 1;
  final String labelText;
  final double borderRadius;
  MyTextField({
    super.key,
    required this.controller,
    required this.labelText,
    required this.borderRadius,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: maxLines,
      cursorColor: Theme.of(context).colorScheme.inversePrimary,
      controller: controller,
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        labelText: labelText,
        labelStyle: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(color: Theme.of(context).colorScheme.inversePrimary),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(color: Theme.of(context).colorScheme.inversePrimary),
        ),
      ),
    );
  }
}

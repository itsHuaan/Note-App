import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController controller;
  int? maxLines = 1;
  final String hintText;
  Color color;
  MyTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.maxLines,
    this.color = const Color(0xFF000000),
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: maxLines,
      cursorColor: Theme.of(context).colorScheme.inversePrimary,
      controller: controller,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 10.0),
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Color.fromARGB(64, 255, 255, 255),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: color),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: color),
        ),
      ),
    );
  }
}

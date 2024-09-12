import 'package:basic_crud/provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    final themeProvider = Provider.of<ThemeProvider>(context);
    return TextField(
      maxLines: maxLines,
      cursorColor: Theme.of(context).colorScheme.inversePrimary,
      controller: controller,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 10.0),
        hintText: hintText,
        hintStyle: TextStyle(
          color: themeProvider.isDarkMode ? const Color.fromARGB(64, 255, 255, 255) : const Color.fromARGB(64, 0, 0, 0),
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

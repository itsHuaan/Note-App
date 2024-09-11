import 'package:flutter/material.dart';

class MyFloatingButton extends StatelessWidget {
  final void Function()? onPressed;
  final IconData? icon;
  const MyFloatingButton({
    super.key,
    this.onPressed,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 0,
      onPressed: onPressed,
      backgroundColor: Theme.of(context).colorScheme.secondary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50.0),
      ),
      child: Icon(
        icon,
        color: Theme.of(context).colorScheme.inversePrimary,
      ),
    );
  }
}

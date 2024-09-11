import 'package:flutter/material.dart';

class MyNoteTile extends StatelessWidget {
  final String noteTitle;
  final String noteCreated;
  const MyNoteTile({
    super.key,
    required this.noteTitle,
    required this.noteCreated,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(15.0),
      ),
      padding: const EdgeInsets.all(15.0),
      margin: const EdgeInsets.only(
        top: 15.0,
        left: 15.0,
        right: 15.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                noteTitle,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Text(
                'Created: $noteCreated',
                style: const TextStyle(
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ],
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.info_outline_rounded),
          )
        ],
      ),
    );
  }
}

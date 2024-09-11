import 'package:basic_crud/components/my_text_button.dart';
import 'package:basic_crud/components/my_text_field.dart';
import 'package:basic_crud/services/firestore.dart';
import 'package:flutter/material.dart';

class AddNewNote extends StatelessWidget {
  final TextEditingController titleController;
  final TextEditingController detailController;
  final FirestoreService firestoreService;
  const AddNewNote({
    super.key,
    required this.titleController,
    required this.detailController,
    required this.firestoreService,
  });

  @override
  Widget build(BuildContext context) {
    double popupWidth = 300.0;
    return AlertDialog(
      backgroundColor: Theme.of(context).colorScheme.primary,
      title: const Text("Add a new note"),
      content: Container(
        constraints: BoxConstraints(
          maxWidth: popupWidth,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min, // Makes Column take up only as much vertical space as needed
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: popupWidth,
                child: MyTextField(
                  controller: titleController,
                  labelText: "Title",
                  borderRadius: 15.0,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: popupWidth,
                child: MyTextField(
                  controller: detailController,
                  labelText: "Note details",
                  borderRadius: 15.0,
                  maxLines: 4,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MyTextButton(
                  text: "Cancel",
                  onPressed: () {
                    Navigator.pop(context);
                    titleController.clear();
                    detailController.clear();
                  },
                ),
                MyTextButton(
                  text: "Save",
                  onPressed: () {
                    if (titleController.text.isNotEmpty && detailController.text.isNotEmpty) {
                      Navigator.pop(context);
                      firestoreService.addNote(titleController.text, detailController.text);
                      titleController.clear();
                      detailController.clear();
                    }
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

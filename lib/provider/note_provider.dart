import 'package:basic_crud/components/add_new_note.dart';
import 'package:basic_crud/services/firestore.dart';
import 'package:flutter/material.dart';

class NoteProvider extends ChangeNotifier {
  void addNote(BuildContext context, TextEditingController titleController, TextEditingController detailController, FirestoreService firestoreService) {
    showDialog(
      context: context,
      builder: (context) {
        return AddNewNote(
          titleController: titleController,
          detailController: detailController,
          firestoreService: firestoreService,
        );
      },
    );
  }
}

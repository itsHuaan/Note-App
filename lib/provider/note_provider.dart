import 'package:basic_crud/pages/add_new_note_page.dart';
import 'package:basic_crud/services/firestore.dart';
import 'package:flutter/material.dart';

class NoteProvider extends ChangeNotifier {
  void addNote(
    BuildContext context,
    TextEditingController titleController,
    TextEditingController detailController,
    FirestoreService firestoreService,
  ) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddNewNotePage(
          titleController: titleController,
          detailController: detailController,
          firestoreService: firestoreService,
        ),
      ),
    );
  }
}

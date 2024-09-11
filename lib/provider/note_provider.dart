import 'package:basic_crud/pages/add_new_note_page.dart';
import 'package:basic_crud/pages/edit_note_page.dart';
import 'package:basic_crud/services/firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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

  void updateNote(
    BuildContext context,
    TextEditingController titleController,
    TextEditingController detailController,
    FirestoreService firestoreService,
    String noteID,
  ) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditNotePage(
          noteID: noteID,
          titleController: titleController,
          detailController: detailController,
          firestoreService: firestoreService,
        ),
      ),
    );
  }

  Future<void> fetchNote(
    BuildContext context,
    TextEditingController titleController,
    TextEditingController detailController,
    FirestoreService firestoreService,
    String noteID,
  ) async {
    DocumentSnapshot noteSnapshot = await firestoreService.getNoteByID(noteID);
    if (noteSnapshot.exists) {
      Map<String, dynamic> noteData = noteSnapshot.data() as Map<String, dynamic>;
      titleController.text = noteData['title'];
      detailController.text = noteData['detail'];
    }
  }
}
